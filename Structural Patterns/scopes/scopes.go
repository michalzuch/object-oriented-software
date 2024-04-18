package scopes

import "gorm.io/gorm"

func WithAllSubmodels(db *gorm.DB) *gorm.DB {
	return db.Preload("Coord").Preload("Weather").Preload("Main").Preload("Wind").Preload("Rain").Preload("Clouds").Preload("Sys")
}
