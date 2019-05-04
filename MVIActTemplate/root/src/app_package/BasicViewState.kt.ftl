package ${kotlinEscapedPackageName}

import com.github.qingmei2.mvi.base.viewstate.IViewState

data class ${viewStateClass}(
    val errors: Throwable?,
    val uiEvent: ${viewStateClass}Event?
) : IViewState {

    companion object {

        fun idle(): ${viewStateClass} {
            return ${viewStateClass}(
                errors = null,
                uiEvent = null
            )
        }
    }
}

sealed class ${viewStateClass}Event {

}