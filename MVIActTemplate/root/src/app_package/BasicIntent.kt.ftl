package ${kotlinEscapedPackageName}

import com.github.qingmei2.mvi.base.intent.IIntent

sealed class ${intentClass} : IIntent {

    object InitialIntent : ${intentClass}()
}