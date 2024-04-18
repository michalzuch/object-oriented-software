package services

import (
	"Structural_Patterns/models"
	"encoding/json"
	"errors"
	"gorm.io/gorm"
	"io"
	"net/http"
	"os"
)

func findOrCreateCity(city string, db *gorm.DB) (*models.CityModel, error) {
	var cityModel *models.CityModel
	if err := db.Where("name = ?", city).First(&cityModel).Error; err != nil {
		cityModel, err = findCoordinates(city)
		if err != nil {
			return nil, err
		}
	}
	return cityModel, nil
}

const (
	APIEndpoint = "https://api.openweathermap.org/geo/1.0/direct?q="
	Parameters  = "&limit=1&appid="
)

func findCoordinates(city string) (*models.CityModel, error) {
	APIKey := os.Getenv("OPEN_WEATHER_API")
	resp, err := http.Get(APIEndpoint + city + Parameters + APIKey)
	if err != nil {
		return nil, err
	}

	defer func(Body io.ReadCloser) {
		err := Body.Close()
		if err != nil {
			panic("Failed to close the body")
		}
	}(resp.Body)

	var cityModels []models.CityModel
	if err := json.NewDecoder(resp.Body).Decode(&cityModels); err != nil {
		return nil, err
	}

	if len(cityModels) == 0 {
		return nil, errors.New("no city found")
	}

	return &cityModels[0], nil
}
