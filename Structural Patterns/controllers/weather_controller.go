package controllers

import (
	"Structural_Patterns/models"
	"Structural_Patterns/scopes"
	"gorm.io/gorm"
	"net/http"

	"github.com/labstack/echo/v4"
)

func ReadWeather(c echo.Context, db *gorm.DB) error {
	var weather models.WeatherModel
	result := db.Scopes(scopes.WithAllSubmodels).First(&weather)
	if result.Error != nil {
		return c.JSON(http.StatusNotFound, "Weather data not found")
	}

	return c.JSON(http.StatusOK, weather)
}
