package main

import (
	"Structural_Patterns/models"
	"Structural_Patterns/routes"
	"github.com/joho/godotenv"
	"github.com/labstack/echo/v4"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func main() {
	err := godotenv.Load(".env")
	if err != nil {
		panic("Failed to load .env file")
	}

	db, err := gorm.Open(sqlite.Open("data.db"), &gorm.Config{})
	if err != nil {
		panic("Failed to connect database")
	}

	err = db.AutoMigrate(&models.Coord{}, &models.Weather{}, &models.Main{}, &models.Wind{}, &models.Rain{}, &models.Clouds{}, &models.Sys{}, &models.WeatherModel{})
	if err != nil {
		panic("Failed to migrate weather database")
	}

	e := echo.New()
	routes.SetupRoutes(e, db)
	e.Logger.Fatal(e.Start(":1323"))
}
