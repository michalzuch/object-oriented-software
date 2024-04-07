package main

import (
	"Structural_Patterns/routes"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	routes.SetupRoutes(e)
	e.Logger.Fatal(e.Start(":1323"))
}
