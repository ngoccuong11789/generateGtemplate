package vn.com.tma.vndiep.tool.soctrip_icon_generator.namemap

import vn.com.tma.vndiep.tool.soctrip_icon_generator.IconModel

class CompoundNameMapWriter(
    private val writers: List<NameMapWriter>
) : NameMapWriter {

    override fun writeHead() {
        writers.forEach {
            it.writeHead()
        }
    }

    override fun writeFoot() {
        writers.forEach {
            it.writeFoot()
        }
    }

    override fun write(icon: IconModel) {
        writers.forEach {
            it.write(icon)
        }
    }

    override fun close() {
        writers.forEach {
            it.close()
        }
    }
}