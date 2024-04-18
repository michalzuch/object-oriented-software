package services

import (
	"Structural_Patterns/models"
	"gorm.io/gorm"
)

func ImportData() []models.WeatherModel {
	var weather = models.Weather{
		ID:          501,
		Main:        "Rain",
		Description: "moderate rain",
		Icon:        "10d",
	}

	var weatherModel = models.WeatherModel{
		Model:      gorm.Model{},
		Coord:      models.Coord{Lon: 10.99, Lat: 44.34},
		Weather:    []models.Weather{weather},
		Base:       "stations",
		Main:       models.Main{Temp: 298.48, FeelsLike: 298.74, TempMin: 297.56, TempMax: 300.05, Pressure: 1015, Humidity: 64, SeaLevel: 1015, GrndLevel: 933},
		Visibility: 10000,
		Wind:       models.Wind{Speed: 0.62, Deg: 349, Gust: 1.18},
		Rain:       models.Rain{OneH: 3.16},
		Clouds:     models.Clouds{All: 100},
		DT:         1661870592,
		Sys:        models.Sys{Type: 2, ID: 2075663, Country: "IT", Sunrise: 1661834187, Sunset: 1661882248},
		Timezone:   7200,
		ID:         3163858,
		Name:       "Zocca",
		Cod:        200,
	}

	return []models.WeatherModel{weatherModel}
}
