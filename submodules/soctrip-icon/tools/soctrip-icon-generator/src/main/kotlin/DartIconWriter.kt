package vn.com.tma.vndiep.tool.soctrip_icon_generator

import java.io.OutputStream
import java.io.OutputStreamWriter
import java.io.PrintWriter
import java.nio.charset.Charset

class DartIconWriter(
    out: OutputStream,
    val nameStandardizer: (name: String) -> String,
    cs: Charset = Charsets.UTF_8
) : PrintWriter(OutputStreamWriter(out, cs)) {

    fun write(icon: IconModel) {
        val name = nameStandardizer(icon.name)
        var code = icon.code.replace("\\","")
        code = "\\u{$code}"
        var color = icon.color
        color = color.replace("#","")
        if(color.length == 6){
            color = "FF$color"
        }
        println("     static const $name = Icon(\"$code\", Color(0x$color));")
    }

}