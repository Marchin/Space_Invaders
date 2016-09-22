package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/images/Enemy0.png", "assets/images/Enemy0.png");
			type.set ("assets/images/Enemy0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy1.png", "assets/images/Enemy1.png");
			type.set ("assets/images/Enemy1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy2.png", "assets/images/Enemy2.png");
			type.set ("assets/images/Enemy2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Nave.png", "assets/images/Nave.png");
			type.set ("assets/images/Nave.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Nave2.png", "assets/images/Nave2.png");
			type.set ("assets/images/Nave2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Shield1.png", "assets/images/Shield1.png");
			type.set ("assets/images/Shield1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Shield2.png", "assets/images/Shield2.png");
			type.set ("assets/images/Shield2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Shield3.png", "assets/images/Shield3.png");
			type.set ("assets/images/Shield3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Shield4.png", "assets/images/Shield4.png");
			type.set ("assets/images/Shield4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
