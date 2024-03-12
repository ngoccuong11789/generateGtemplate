package vn.com.tma.vndiep.tool.soctrip_icon_generator

import vn.com.tma.vndiep.tool.soctrip_icon_generator.namemap.CompoundNameMapWriter
import vn.com.tma.vndiep.tool.soctrip_icon_generator.namemap.NameMapWriter
import vn.com.tma.vndiep.tool.soctrip_icon_generator.namemap.SimpleNameMapWriter
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.util.*

class Generator(val config: Config) {
    fun generate() {
        copyFile(config.sourceFontFile, config.destinationFontFile)
        val processor = InputProcessor()
        DartIconWriter(
            FileOutputStream(config.destinationDartFile),
            this::iconNameStandardize
        ).use { writer ->
            writer.println("import 'dart:ui';")
            writer.println("import 'package:soctrip_icons/icon.dart';")
            writer.println("class Icons {")

            createNameMapWriter().use { nameMapWriter ->
                nameMapWriter.writeHead()
                processor.process(config.sourceCssFile) {
                    writer.write(it)
                    nameMapWriter.write(it)
                }
                nameMapWriter.writeFoot()
            }

            writer.println("}")
        }

    }

    private fun createNameMapWriter(): NameMapWriter {


        val withStandard = SimpleNameMapWriter(
            FileOutputStream(config.destinationDartNameMapPartFile),
            onWriteHead = {
                it.println(config.destinationDartNameMapPartHeader)
                it.println("class _IconByName {")
                it.println("  static const Map<String, soctrip.Icon> map = {")
            },
            nameStandardizer = this::iconNameStandardize,
            onWriteFoot = {
                it.println("  };");
                it.println("}");
            },
        )

        val withOriginal = SimpleNameMapWriter(
            FileOutputStream(config.destinationDartOriginalNameMapPartFile),
            onWriteHead = {
                it.println(config.destinationDartNameMapPartHeader)

                it.println("class _IconByOriginalName {")
                it.println("  static const Map<String, soctrip.Icon> map = {")
            },
            nameStandardizer = this::iconNameStandardize,
            onWriteFoot = {
                it.println("  };");
                it.println("}");
            },
            useOriginalName = true
        )

        return CompoundNameMapWriter(
            listOf(
                withStandard,
                withOriginal
            )
        )
    }

    private fun iconNameStandardize(name: String): String {
        var result = iconNameEndsWithDigitsPreProcess(name)
        result = result.replace(Regex("^sctr-icon-?"), "")
        result = result.replace(Regex("^\\d")) {
            "i-${it.value}"
        }
        result = result.replace(Regex("-([^\\-]?)", RegexOption.UNIX_LINES)) {
            it.groups[1]!!.value.uppercase(Locale.getDefault())
        }
        println(result)
        result = keywordProcess(result)
        return result
    }

    // The lint works wrong this case.
    @Suppress("unused")
    private val backwardCompatibleName_1_0_0: Array<String> = arrayOf(
        "sctr-icon-colors1",
        "sctr-icon-solid-colors1"
    )

    private val dartKeywords: Array<String> = arrayOf(
    "abstract",
    "else",
    "import",
    "show",
    "as",
    "enum",
    "in",
    "static",
    "assert",
    "export",
    "interface",
    "super",
    "async",
    "extends",
    "is",
    "switch",
    "await",
    "extension",
    "late",
    "sync",
    "base",
    "external",
    "library",
    "this",
    "break",
    "factory",
    "mixin",
    "throw",
    "case",
    "false",
    "new",
    "true",
    "catch",
    "null",
    "try",
    "class",
    "final",
    "on",
    "typedef",
    "const",
    "finally",
    "operator",
    "var",
    "continue",
    "for",
    "part",
    "void",
    "covariant",
    "Function",
    "required",
    "when",
    "default",
    "get",
    "rethrow",
    "while",
    "deferred",
    "hide",
    "return",
    "with",
    "do",
    "if",
    "sealed",
    "yield",
    "dynamic",
    "implements",
    "set",
    )
    private fun iconNameEndsWithDigitsPreProcess(name: String): String {
        val pattern = Regex("([a-zA-Z])(\\d+)\$")
        val matchResult = pattern.find(name)
        if(matchResult != null) {
            if(backwardCompatibleName_1_0_0.contains(name)){
                return name
            }
            return name.replace(pattern){
                "${it.groups[1]!!.value}_${it.groups[2]!!.value}_"
            }
        }
        return name
    }

    private fun keywordProcess(name: String): String {
        if(dartKeywords.contains(name)){
            return name + "_"
        }
        return name
    }

    fun copyFile(sourceFilePath: String, destinationFilePath: String) {
        val sourceFile = File(sourceFilePath)
        val destinationFile = File(destinationFilePath)
        val parent = destinationFile.parentFile
        if(!parent.exists()){
            if(!parent.mkdirs()){
                throw RuntimeException("Can not create directory $parent")
            }
        }

        FileInputStream(sourceFile).use { inputStream ->
            FileOutputStream(destinationFile).use { outputStream ->
                inputStream.copyTo(outputStream)
            }
        }
    }
}