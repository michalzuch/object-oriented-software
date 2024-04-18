package controllers

import (
	"Structural_Patterns/services"
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"net/http"
)

func GetWeather(c echo.Context, db *gorm.DB) error {
	city := c.Param("city")
	weather, err := services.GetWeatherForCity(city, db)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}
	return c.JSON(http.StatusOK, weather)
}
