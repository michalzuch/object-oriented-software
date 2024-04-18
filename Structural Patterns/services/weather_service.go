package services

import (
	"Structural_Patterns/models"
	"Structural_Patterns/proxy"
	"Structural_Patterns/scopes"
	"gorm.io/gorm"
)

func GetWeatherForCity(city string, db *gorm.DB) (*models.WeatherModel, error) {
	cityModel, err := findOrCreateCity(city, db)
	if err != nil {
		return nil, err
	}

	weatherModel, err := findOrCreateWeather(cityModel, db)
	if err != nil {
		return nil, err
	}

	return weatherModel, nil
}

func findOrCreateWeather(cityModel *models.CityModel, db *gorm.DB) (*models.WeatherModel, error) {
	var weatherModel *models.WeatherModel
	var coordModel models.Coord

	if err := db.Where("lat = ?", cityModel.Lat).Where("lon = ?", cityModel.Lon).First(&coordModel).Error; err != nil {
		service := &proxy.WeatherProxyImpl{}
		weatherModel, err = service.GetWeather(cityModel.Lat, cityModel.Lon)
		if err != nil {
			return nil, err
		}

		if err := db.Create(&weatherModel).Error; err != nil {
			return nil, err
		}

		cityModel.Lat = weatherModel.Coord.Lat
		cityModel.Lon = weatherModel.Coord.Lon
		if err := db.Create(&cityModel).Error; err != nil {
			return nil, err
		}
	} else {
		db.Scopes(scopes.WithAllSubmodels).Where("ID = ?", coordModel.WeatherModelID).First(&weatherModel)
	}

	return weatherModel, nil
}
