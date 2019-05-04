package ${kotlinEscapedPackageName}

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.github.qingmei2.mvi.base.viewmodel.BaseViewModel
import com.github.qingmei2.mvi.ext.reactivex.notOfType
import com.github.qingmei2.mvi.util.SingletonHolderSingleArg
import com.uber.autodispose.autoDisposable
import io.reactivex.Observable
import io.reactivex.ObservableSource
import io.reactivex.ObservableTransformer
import io.reactivex.functions.BiFunction
import io.reactivex.subjects.PublishSubject

class ${viewModelClass}(
     private val actionProcessorHolder: ${processorHolderClass}
) : BaseViewModel<${intentClass}, ${viewStateClass}>() {

    private val intentSubject: PublishSubject<${intentClass}> = PublishSubject.create()
    private val statesObservable: Observable<${viewStateClass}> = compose()

    private val intentFilter: ObservableTransformer<${intentClass}, ${intentClass}>
        get() = ObservableTransformer { intents ->
            intents.publish { shared ->
                Observable.merge(
                    shared.ofType(${intentClass}.InitialIntent::class.java).take(1),
                    shared.notOfType(${intentClass}.InitialIntent::class.java)
                )
            }
        }

    private fun actionFromIntent(intent: ${intentClass}): ${actionClass} {
        return when (intent) {
            is ${intentClass}.InitialIntent -> ${actionClass}.InitialAction
        }
    }

    override fun processIntents(intents: Observable<${intentClass}>) {
        intents.autoDisposable(this).subscribe(intentSubject)
    }

    override fun states(): Observable<${viewStateClass}> = statesObservable

    private fun compose(): Observable<${viewStateClass}> {
        return intentSubject
            .compose(intentFilter)
            .map(this::actionFromIntent)
            .compose(actionProcessorHolder.actionProcessor)
            .scan(${viewStateClass}.idle(), reducer)
            .switchMap(specialEventProcessor)
            .distinctUntilChanged()
            .replay(1)
            .autoConnect(0)
    }

    private val specialEventProcessor: io.reactivex.functions.Function<${viewStateClass}, ObservableSource<${viewStateClass}>>
            get() = io.reactivex.functions.Function { state ->
                when (state.uiEvent == null) {
                    true -> Observable.just(state)
                    false -> Observable.just(state, state.copy(uiEvent = null))
                }
            }

    companion object {

        private val reducer = BiFunction { previousState: ${viewStateClass}, result: ${resultClass} ->
            when (result) {
                is ${resultClass}.InitialResult -> {
                    previousState
                }
            }
        }
    }
}

@Suppress("UNCHECKED_CAST")
class ${viewModelClass}Factory(
    private val actionProcessorHolder: ${processorHolderClass}
) : ViewModelProvider.Factory {

    override fun <T : ViewModel?> create(modelClass: Class<T>): T =
        ${viewModelClass}(actionProcessorHolder) as T

    companion object :
        SingletonHolderSingleArg<${viewModelClass}Factory, ${processorHolderClass}>(::${viewModelClass}Factory)
}