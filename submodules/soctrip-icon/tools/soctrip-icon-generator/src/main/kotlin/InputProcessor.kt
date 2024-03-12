package vn.com.tma.vndiep.tool.soctrip_icon_generator

import java.io.File

class InputProcessor {

    // The lint works wrong this case.
    @Suppress("unused")
    private val processedIcon = HashSet<String>()
    fun process(fileName: String, callback: (IconModel) -> Unit) {
        val fileContent = File(fileName).readText()
        val regexPattern =
            Regex("\\.([\\w\\-\\d]+):before\\s*\\{[^}]+\\}")

        val matches = regexPattern.findAll(fileContent)
        matches.forEach {
            val name = it.groups[1]!!.value

            val contentPattern  =Regex("content\\s*:\\s*\"([^\"]*)\"\\s*;")
            val colorPattern = Regex("color\\s*:\\s*([^\"]*)\\s*;")
            contentPattern.find(it.value)?.let {contentResult ->
                val content = contentResult.groups[1]!!.value
                var color = "#667085"
                colorPattern.find(it.value)?.let { colorResult->
                    color = colorResult.groups[1]!!.value
                }
                if (!processedIcon.contains(name)) {
                    callback(IconModel(name, content, color))
                }
                processedIcon.add(name)
            }
            //val icon = IconModel(it.groups[1]!!.value, it.groups[2]!!.value, it.groups[3]!!.value)
            //callback(icon)
        }
    }
}
