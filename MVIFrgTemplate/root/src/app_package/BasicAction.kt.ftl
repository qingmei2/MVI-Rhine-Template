package ${kotlinEscapedPackageName}

import com.github.qingmei2.mvi.base.action.IAction

sealed class ${actionClass} : IAction {

    object InitialAction : ${actionClass}()
}