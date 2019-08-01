<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <@kt.addAllKotlinDependencies />

    <instantiate from="root/src/app_package/BasicFragment.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${className}.kt" />

    <instantiate from="root/res/layout/fragment.xml"
                 to="${escapeXmlAttribute(resOut)}/layout/${fragment_layout}.xml" />

    <instantiate from="root/src/app_package/BasicFragmentViewModel.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${viewModelClass}.kt" />

    <instantiate from="root/src/app_package/BasicFragmentModule.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${className}Module.kt" />

    <instantiate from="root/src/app_package/BasicAction.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${actionClass}.kt" />
    <instantiate from="root/src/app_package/BasicResult.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${resultClass}.kt" />
    <instantiate from="root/src/app_package/BasicIntent.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${intentClass}.kt" />
    <instantiate from="root/src/app_package/BasicViewState.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${viewStateClass}.kt" />

    <instantiate from="root/src/app_package/BasicRepository.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${extractLetters(objectKind)}Repository.kt" />
    <instantiate from="root/src/app_package/BasicActionProcessorHolder.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/${processorHolderClass}.kt" />

    <open file="${escapeXmlAttribute(srcOut)}/${className}.${ktOrJavaExt}" />
</recipe>
