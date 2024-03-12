package vn.com.tma.vndiep.tool.soctrip_icon_generator.namemap

import vn.com.tma.vndiep.tool.soctrip_icon_generator.IconModel
import java.io.Closeable

interface NameMapWriter : Closeable {
    fun writeHead()
    fun writeFoot()
    fun write(icon: IconModel)
}