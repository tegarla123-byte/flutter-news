# Project Structure

Only the `assets` and `lib` trees are listed below.

```
assets/
  env/.env.dev
  env/.env.dist
  env/.env.prod
  env/.env.staging

lib/
  app.dart
  main_dev.dart
  main_prod.dart
  main_staging.dart
  core/
    config/
      env_loader.dart
      flavor.dart
      flavor_config.dart
    network/
      dio_provider.dart
    router/
      app_router.dart
  data/
    models/
      article_dto.dart
      article_dto.g.dart
    repositories/
      news_repository_impl.dart
    sources/
      news_api.dart
      news_api.g.dart
  di/
    injector.dart
  domain/
    entities/
      article.dart
    repositories/
      news_repository.dart
    usecases/
      get_top_headlines.dart
      toggle_bookmark.dart
  presentation/
    bloc/
      news_list_cubit.dart
      news_list_state.dart
    pages/
      news_detail_page.dart
      news_list_page.dart
    widgets/
      article_tile.dart
```

## Folder notes
- `assets/`: environment files for each flavor plus a shared template.
- `lib/app.dart`: root widget wiring app-level configuration.
- `lib/main_*.dart`: flavor-specific entrypoints (dev, staging, prod).
- `lib/core/`: cross-cutting concerns  
  - `config/`: flavor setup and environment loader.  
  - `network/`: Dio client/provider.  
  - `router/`: `GoRouter` configuration.
- `lib/data/`: data layer implementations  
  - `models/`: DTOs and generated serializers.  
  - `repositories/`: concrete repository using data sources.  
  - `sources/`: Retrofit API client and generated code.
- `lib/di/`: service locator setup via `injector.dart`.
- `lib/domain/`: business logic contracts and use cases  
  - `entities/`: core domain entities.  
  - `repositories/`: repository interfaces.  
  - `usecases/`: application-specific actions.
- `lib/presentation/`: UI layer  
  - `bloc/`: Cubit/state for news list.  
  - `pages/`: screens for list and detail.  
  - `widgets/`: reusable UI components.
