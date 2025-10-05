extends Control

signal changePage(page: Control)
@onready var tables_button: Button = $TabButtonHBox/TablesButton
@onready var shop_button: Button = $TabButtonHBox/ShopButton
@onready var settings_button: Button = $TabButtonHBox/SettingsButton
@onready var settings_page: Control = $SettingsPage
@onready var shop_page: Control = $ShopPage
@onready var tables_page: Control = $TablesPage


var defaultPage
var currentPage

func _ready() -> void:
	defaultPage = tables_page
	currentPage = tables_page
	changePage.connect(changePageFunc)
	tables_button.pressed.connect(changeToTablesPage)
	shop_button.pressed.connect(changeToShopPage)
	settings_button.pressed.connect(changeToSettingsPage)
	defaultPage.visible = true
	
func changePageFunc(page):
	currentPage.visible = false
	currentPage = page
	currentPage.visible = true
	
func changeToTablesPage():
	changePage.emit(tables_page)
	
func changeToShopPage():
	changePage.emit(shop_page)
	
func changeToSettingsPage():
	changePage.emit(settings_page)
	

	
