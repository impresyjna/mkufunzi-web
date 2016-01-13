# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MeasureType.create(name: "ciśnienie", unit: "mm Hg", extra_field: true)
MeasureType.create(name: "puls", unit: "/min")
MeasureType.create(name: "waga", unit: "kg")

BloodType.create(name: "0Rh-")
BloodType.create(name: "0Rh+")
BloodType.create(name: "BRh-")
BloodType.create(name: "BRh+")
BloodType.create(name: "ARh-")
BloodType.create(name: "ARh+")
BloodType.create(name: "ABRh-")
BloodType.create(name: "ABRh+")

EyeColor.create(name: "czarno-brązowe", color: "#2E1913")
EyeColor.create(name: "ciemnobrązowe", color: "#5D4037")
EyeColor.create(name: "piwne(brązowe)", color: "#795548")
EyeColor.create(name: "jasnobrązowe", color: "#D7CCC8")
EyeColor.create(name: "zielonopiwne", color: "#47430F")
EyeColor.create(name: "jasnozielone", color: "#8BC34A")
EyeColor.create(name: "ciemnoszare", color: "#727272")
EyeColor.create(name: "jasnoszare", color: "#B6B6B6")
EyeColor.create(name: "niebieskie", color: "#448AFF")
EyeColor.create(name: "jasnoniebieskie", color: "#BBDEFB")
