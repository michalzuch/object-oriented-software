package routes

import (
	"Structural_Patterns/controllers"

	"github.com/labstack/echo/v4"
)

func SetupRoutes(e *echo.Echo) {
	e.GET("/weather", controllers.ReadWeather)
	e.POST("/weather", controllers.ReadWeather)
}
