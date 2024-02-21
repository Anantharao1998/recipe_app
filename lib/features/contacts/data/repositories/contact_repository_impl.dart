// ignore_for_file: always_specify_types

import 'package:dartz/dartz.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/contacts/contacts.dart';
import 'package:pokemondb/features/contacts/data/datasources/contact_remote_datasource.dart';

/// Contact repository implementation
class ContactRepositoryImpl with ApiCallHandler implements ContactRepository {
  /// Constructor
  ContactRepositoryImpl({required this.remoteDataSource});

  /// Remote datasource instance
  final ContactRemoteDataSource remoteDataSource;

  @override
  Future<void> addContact(final ContactItem contactItem) async {
    await remoteDataSource.addContact(contactItem.toJson());
  }

  @override
  // ignore: prefer_expression_function_bodies
  Future<Either<Exception, List<ContactItem>>> getContacts() async {
    return callApiWithErrorHandler<Exception, List<ContactItem>>(() => remoteDataSource.getContact());

    // try {
    //   final List<ContactItem> result = await remoteDataSource.getContact();

    //   return Right(result);
    // } on Exception catch (error) {
    //   return Left(error);
    // }
  }
}
