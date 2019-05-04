package ${kotlinEscapedPackageName}

import com.github.qingmei2.mvi.base.result.IResult

sealed class ${resultClass} : IResult {

    object InitialResult : ${resultClass}()
}