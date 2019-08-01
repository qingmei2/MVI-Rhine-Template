package ${kotlinEscapedPackageName}

import androidx.lifecycle.ViewModelProviders
import dagger.Module
import dagger.Provides
import com.github.qingmei2.mvi.di.ActivityScope

@Module
class ${className}Module {

    @ActivityScope
    @Provides
    fun providesViewModel(
        activity: ${className},
        processorHolder: ${processorHolderClass}
    ): ${viewModelClass} {
        return ViewModelProviders
            .of(activity, ${viewModelClass}Factory(processorHolder))[${viewModelClass}::class.java]
    }

    @ActivityScope
    @Provides
    fun providesActionProcessorHolder(
        repository: ${dataSourceRepositoryName}
    ): ${processorHolderClass} {
        return ${processorHolderClass}(repository)
    }

    @ActivityScope
    @Provides
    fun providesRepository(): ${dataSourceRepositoryName} {
        return ${dataSourceRepositoryName}(
            remoteDataSource = ${remoteDataSourceName}(),
            localDataSource = ${localDataSourceName}()
        )
    }
}