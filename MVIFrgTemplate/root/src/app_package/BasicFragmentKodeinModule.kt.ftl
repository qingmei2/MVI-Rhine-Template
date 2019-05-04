package ${kotlinEscapedPackageName}

import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProviders
import org.kodein.di.Kodein
import org.kodein.di.android.x.AndroidLifecycleScope
import org.kodein.di.generic.bind
import org.kodein.di.generic.instance
import org.kodein.di.generic.scoped
import org.kodein.di.generic.singleton

val ${kodeinModuleName} = Kodein.Module("${kodeinModuleName}") {

    bind<${viewModelClass}>() with scoped<Fragment>(AndroidLifecycleScope).singleton {
        ViewModelProviders
            .of(context, ${viewModelClass}Factory.getInstance(instance()))[${viewModelClass}::class.java]
    }

    bind<${dataSourceRepositoryName}>() with singleton {
        ${dataSourceRepositoryName}(instance(), instance())
    }

    bind<${localDataSourceName}>() with singleton {
        ${localDataSourceName}()
    }

    bind<${remoteDataSourceName}>() with singleton {
        ${remoteDataSourceName}()
    }

    bind<${processorHolderClass}>() with singleton {
        ${processorHolderClass}(
            repository = instance()
        )
    }
}