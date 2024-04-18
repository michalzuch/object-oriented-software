package main

import (
	"Structural_Patterns/models"
	"Structural_Patterns/routes"
	"Structural_Patterns/services"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"

	"github.com/labstack/echo/v4"
)

func main() {
	db, err := gorm.Open(sqlite.Open("data.db"), &gorm.Config{})
	if err != nil {
		panic("Failed to connect database")
	}

	err = db.AutoMigrate(&models.Coord{}, &models.Weather{}, &models.Main{}, &models.Wind{}, &models.Rain{}, &models.Clouds{}, &models.Sys{}, &models.WeatherModel{})
	if err != nil {
		panic("Failed to migrate weather database")
	}

	var weatherData = services.ImportData()
	result := db.Create(weatherData)
	if result.Error != nil {
		panic("Failed to save data in database")
	}

	e := echo.New()
	routes.SetupRoutes(e, db)
	e.Logger.Fatal(e.Start(":1323"))
}
