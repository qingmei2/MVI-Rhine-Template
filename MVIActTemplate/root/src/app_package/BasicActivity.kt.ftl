package ${kotlinEscapedPackageName}

import android.os.Bundle
import javax.inject.Inject
import com.uber.autodispose.autoDisposable
import io.reactivex.Observable
import com.github.qingmei2.mvi.base.view.activity.BaseActivity
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>

class ${className} : BaseActivity<${intentClass}, ${viewStateClass}>() {

    @Inject
    lateinit var mViewModel: ${viewModelClass}

    override val layoutId: Int = R.layout.${activity_layout}

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

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
}