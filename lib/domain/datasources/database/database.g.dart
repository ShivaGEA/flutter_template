// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder databaseBuilder(String name) =>
      _$AppDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDataBaseBuilder(null);
}

class _$AppDataBaseBuilder {
  _$AppDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDataBase extends AppDataBase {
  _$AppDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GitRepositoryDaoImpl? _repositoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GitRepo` (`id` INTEGER NOT NULL, `fullName` TEXT, `name` TEXT, `owner` TEXT, `ownerName` TEXT, `ownerImage` TEXT, `description` TEXT, `url` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GitRepositoryDaoImpl get repositoryDao {
    return _repositoryDaoInstance ??=
        _$GitRepositoryDaoImpl(database, changeListener);
  }
}

class _$GitRepositoryDaoImpl extends GitRepositoryDaoImpl {
  _$GitRepositoryDaoImpl(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _gitRepoInsertionAdapter = InsertionAdapter(
            database,
            'GitRepo',
            (GitRepo item) => <String, Object?>{
                  'id': item.id,
                  'fullName': item.fullName,
                  'name': item.name,
                  'owner': item.owner,
                  'ownerName': item.ownerName,
                  'ownerImage': item.ownerImage,
                  'description': item.description,
                  'url': item.url
                },
            changeListener),
        _gitRepoUpdateAdapter = UpdateAdapter(
            database,
            'GitRepo',
            ['id'],
            (GitRepo item) => <String, Object?>{
                  'id': item.id,
                  'fullName': item.fullName,
                  'name': item.name,
                  'owner': item.owner,
                  'ownerName': item.ownerName,
                  'ownerImage': item.ownerImage,
                  'description': item.description,
                  'url': item.url
                },
            changeListener),
        _gitRepoDeletionAdapter = DeletionAdapter(
            database,
            'GitRepo',
            ['id'],
            (GitRepo item) => <String, Object?>{
                  'id': item.id,
                  'fullName': item.fullName,
                  'name': item.name,
                  'owner': item.owner,
                  'ownerName': item.ownerName,
                  'ownerImage': item.ownerImage,
                  'description': item.description,
                  'url': item.url
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GitRepo> _gitRepoInsertionAdapter;

  final UpdateAdapter<GitRepo> _gitRepoUpdateAdapter;

  final DeletionAdapter<GitRepo> _gitRepoDeletionAdapter;

  @override
  Future<List<GitRepo>> findAllRepositories() async {
    return _queryAdapter.queryList('SELECT * FROM Repository',
        mapper: (Map<String, Object?> row) => GitRepo(
            row['id'] as int,
            row['name'] as String?,
            row['fullName'] as String?,
            row['owner'] as String?,
            row['description'] as String?,
            row['url'] as String?));
  }

  @override
  Stream<List<GitRepo>> findAllRepositoriesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Repository',
        mapper: (Map<String, Object?> row) => GitRepo(
            row['id'] as int,
            row['name'] as String?,
            row['fullName'] as String?,
            row['owner'] as String?,
            row['description'] as String?,
            row['url'] as String?),
        queryableName: 'GitRepo',
        isView: false);
  }

  @override
  Future<void> insertRepository(GitRepo repository) async {
    await _gitRepoInsertionAdapter.insert(repository, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertRepositories(List<GitRepo> repositories) async {
    await _gitRepoInsertionAdapter.insertList(
        repositories, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRepository(GitRepo repository) async {
    await _gitRepoUpdateAdapter.update(repository, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRepositories(List<GitRepo> repository) async {
    await _gitRepoUpdateAdapter.updateList(
        repository, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteRepository(GitRepo repository) async {
    await _gitRepoDeletionAdapter.delete(repository);
  }

  @override
  Future<void> deleteRepositories(List<GitRepo> repositories) async {
    await _gitRepoDeletionAdapter.deleteList(repositories);
  }
}
