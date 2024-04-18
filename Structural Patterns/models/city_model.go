package models

import "gorm.io/gorm"

type CityModel struct {
	gorm.Model
	Name string  `json:"name"`
	Lat  float64 `json:"lat"`
	Lon  float64 `json:"lon"`
}
