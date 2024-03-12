package vn.com.tma.vndiep.tool.soctrip_icon_generator

class Main {
    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            val config = Config()
            val generator =  Generator(config)
            generator.generate()
        }
    }

}