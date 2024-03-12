package vn.com.tma.vndiep.tool.soctrip_icon_generator.namemap

import vn.com.tma.vndiep.tool.soctrip_icon_generator.IconModel
import java.io.OutputStream
import java.io.OutputStreamWriter
import java.io.PrintWriter
import java.nio.charset.Charset

class SimpleNameMapWriter(
    out: OutputStream,
    private val onWriteHead: (writer: SimpleNameMapWriter) -> Unit,
    private val nameStandardizer: (name: String) -> String,
    private val onWriteFoot: (writer: SimpleNameMapWriter) -> Unit,
    private val useOriginalName: Boolean = false,
    cs: Charset = Charsets.UTF_8,
    private val indent: String = "    "
) : PrintWriter(OutputStreamWriter(out, cs)), NameMapWriter {
    override fun writeHead() {
        onWriteHead(this)
    }

    override fun writeFoot() {
        onWriteFoot(this)
    }

    override fun write(icon: IconModel) {
        val variableName = nameStandardizer(icon.name)
        val iconName: String = if (useOriginalName) {
            icon.name
        } else {
            variableName
        }
        println("$indent\"${iconName}\": soctrip.Icons.$variableName,")
    }
}