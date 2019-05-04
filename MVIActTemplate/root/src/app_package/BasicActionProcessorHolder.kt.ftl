package ${kotlinEscapedPackageName}

import com.github.qingmei2.mvi.ext.reactivex.flatMapErrorActionObservable
import io.reactivex.Observable
import io.reactivex.ObservableTransformer
import io.reactivex.subjects.PublishSubject

class ${processorHolderClass}(
    private val repository: ${dataSourceRepositoryName}
) {

    private val initialActionTransformer =
        ObservableTransformer<${actionClass}.InitialAction, ${resultClass}.InitialResult> { action ->
            action.flatMap<${resultClass}.InitialResult> {
                Observable.just(${resultClass}.InitialResult)
            }
        }

    val actionProcessor: ObservableTransformer<${actionClass}, ${resultClass}> =
           ObservableTransformer { actions ->
               actions.publish { shared ->
                   Observable.mergeArray(
                       shared.ofType(${actionClass}.InitialAction::class.java).compose<${resultClass}>(initialActionTransformer),
                       shared.filter { o ->
                           o !is ${actionClass}.InitialAction
                       }.flatMapErrorActionObservable()
                   )
               }
           }
}