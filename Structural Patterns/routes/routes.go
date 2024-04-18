package routes

import (
	"Structural_Patterns/controllers"
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func SetupRoutes(e *echo.Echo, db *gorm.DB) {
	e.GET("/weather/:city", GetWeatherHandler(db))
	e.POST("/weather/:city", GetWeatherHandler(db))
}

func GetWeatherHandler(db *gorm.DB) echo.HandlerFunc {
	return func(c echo.Context) error {
		return controllers.GetWeather(c, db)
	}
}
