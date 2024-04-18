package models

import "gorm.io/gorm"

type Coord struct {
	ID             uint    `gorm:"primary_key"`
	Lon            float64 `json:"lon"`
	Lat            float64 `json:"lat"`
	WeatherModelID uint
}

type Weather struct {
	ID             uint   `gorm:"primary_key"`
	Main           string `json:"main"`
	Description    string `json:"description"`
	Icon           string `json:"icon"`
	WeatherModelID uint
}

type Main struct {
	ID             uint    `gorm:"primary_key"`
	Temp           float64 `json:"temp"`
	FeelsLike      float64 `json:"feels_like"`
	TempMin        float64 `json:"temp_min"`
	TempMax        float64 `json:"temp_max"`
	Pressure       int     `json:"pressure"`
	Humidity       int     `json:"humidity"`
	SeaLevel       int     `json:"sea_level"`
	GrndLevel      int     `json:"grnd_level"`
	WeatherModelID uint
}

type Wind struct {
	ID             uint    `gorm:"primary_key"`
	Speed          float64 `json:"speed"`
	Deg            int     `json:"deg"`
	Gust           float64 `json:"gust"`
	WeatherModelID uint
}

type Rain struct {
	ID             uint    `gorm:"primary_key"`
	OneH           float64 `json:"1h"`
	WeatherModelID uint
}

type Clouds struct {
	ID             uint `gorm:"primary_key"`
	All            int  `json:"all"`
	WeatherModelID uint
}

type Sys struct {
	ID             uint   `gorm:"primary_key"`
	Type           int    `json:"type"`
	Country        string `json:"country"`
	Sunrise        int    `json:"sunrise"`
	Sunset         int    `json:"sunset"`
	WeatherModelID uint
}

type WeatherModel struct {
	gorm.Model
	Coord      Coord `gorm:"foreignkey:WeatherModelID"`
	Weather    []Weather
	Base       string
	Main       Main
	Visibility int
	Wind       Wind
	Rain       Rain
	Clouds     Clouds
	DT         int
	Sys        Sys
	Timezone   int
	ID         int
	Name       string
	Cod        int
}
