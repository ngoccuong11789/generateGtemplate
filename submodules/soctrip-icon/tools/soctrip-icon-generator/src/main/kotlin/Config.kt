package vn.com.tma.vndiep.tool.soctrip_icon_generator

import java.nio.file.Paths

class Config(
    private val sourceDir: String = "./src/src-font/package",
    private val destinationDir: String = "../../"

) {
    val sourceFontFile: String get() = Paths.get(sourceDir, "fonts/soctrip-icon.ttf").toString()
    val sourceCssFile: String get() = Paths.get(sourceDir, "soctrip-icon.css").toString()

    val destinationFontFile: String get() = Paths.get(destinationDir, "assets/fonts/soctrip-icon.ttf").toString()
    val destinationDartFile: String get() = Paths.get(destinationDir, "lib/icons.dart").toString()
    val destinationDartNameMapPartFile: String get() = Paths.get(destinationDir, "lib/icons_by_name.dart").toString()
    val destinationDartOriginalNameMapPartFile: String get() = Paths.get(destinationDir, "lib/icons_by_original_name.dart").toString()

    val destinationDartNameMapPartHeader: String get() = "part of \"soctrip_icons.dart\";"

}