package ${kotlinEscapedPackageName}

import androidx.lifecycle.ViewModelProviders
import dagger.Module
import dagger.Provides
import com.github.qingmei2.mvi.di.FragmentScope

@Module
class ${className}Module {

    @FragmentScope
    @Provides
    fun providesViewModel(
        fragment: ${className},
        processorHolder: ${processorHolderClass}
    ): ${viewModelClass} {
        return ViewModelProviders
            .of(fragment, ${viewModelClass}Factory(processorHolder))[${viewModelClass}::class.java]
    }

    @FragmentScope
    @Provides
    fun providesActionProcessorHolder(
        repository: ${dataSourceRepositoryName}
    ): ${processorHolderClass} {
        return ${processorHolderClass}(repository)
    }

    @FragmentScope
    @Provides
    fun providesRepository(): ${dataSourceRepositoryName} {
        return ${dataSourceRepositoryName}(
            remoteDataSource = ${remoteDataSourceName}(),
            localDataSource = ${localDataSourceName}()
        )
    }
}