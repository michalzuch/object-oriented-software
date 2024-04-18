package controllers

import (
	"Structural_Patterns/proxy"
	"net/http"

	"github.com/labstack/echo/v4"
)

func ReadWeather(c echo.Context) error {
	service := &proxy.WeatherProxyImpl{}
	weather, err := service.GetWeather()

	if err != nil {
		return c.JSON(http.StatusNotFound, "Weather data not found")
	}

	return c.JSON(http.StatusOK, weather)
}
