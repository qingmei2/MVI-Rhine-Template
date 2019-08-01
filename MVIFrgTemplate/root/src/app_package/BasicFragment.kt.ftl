package ${kotlinEscapedPackageName}

import android.os.Bundle
import android.view.View
import javax.inject.Inject
import com.uber.autodispose.autoDisposable
import io.reactivex.Observable
import com.github.qingmei2.mvi.base.view.fragment.BaseFragment
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>

class ${className} : BaseFragment<${intentClass}, ${viewStateClass}>() {

    @Inject
    lateinit var mViewModel: ${viewModelClass}

    override val layoutId: Int = R.layout.${fragment_layout}

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        binds()
    }

    private fun binds() {
        mViewModel.states()
            .autoDisposable(scopeProvider)
            .subscribe(this::render)

        mViewModel.processIntents(intents())
    }

    override fun intents(): Observable<${intentClass}> {
        return initialIntent()
    }

    private fun initialIntent(): Observable<${intentClass}> = Observable.just(${intentClass}.InitialIntent)

    override fun render(state: ${viewStateClass}) {

    }

    companion object {

        fun instance(): ${className} = ${className}()
    }
}