package proxy

import (
	"Structural_Patterns/models"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
)

const (
	APIEndpoint = "https://api.openweathermap.org/data/2.5/weather"
	Lat         = "?lat="
	Lon         = "&lon="
	AppID       = "&appid="
)

type WeatherProxy interface {
	GetWeather() (models.WeatherModel, error)
}

type WeatherProxyImpl struct{}

func (s *WeatherProxyImpl) GetWeather(lat float64, lon float64) (*models.WeatherModel, error) {
	APIKey := os.Getenv("OPEN_WEATHER_API")
	latString := fmt.Sprintf("%f", lat)
	lonString := fmt.Sprintf("%f", lon)

	resp, err := http.Get(APIEndpoint + Lat + latString + Lon + lonString + AppID + APIKey)
	if err != nil {
		return nil, err
	}

	defer func(Body io.ReadCloser) {
		err := Body.Close()
		if err != nil {
			panic("Failed to close the body")
		}
	}(resp.Body)

	var weatherModel models.WeatherModel
	if err := json.NewDecoder(resp.Body).Decode(&weatherModel); err != nil {
		return nil, err
	}

	return &weatherModel, nil
}
