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