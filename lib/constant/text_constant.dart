// constant/text_constant.dart

//Defaults
const textSizeDefaultPaddin = 10.0;

//Register
const textTitleRegister = 'Register';
const textHintTextNameRegister = 'ingrese su nombre';
const textLabelNameRegister = 'Nombre';
const textHintTextLastNameRegister = 'ingrese su apellido';
const textLabelLastNameRegister = 'Apellido';
const textHintTextDniRegister = 'ingrese su DNI';
const textLabelDniRegister = 'DNI';
const textHintIdentificationRegister = 'ingrese su DNI sin guiones ni puntos';
const textLabelIdentificationRegister = 'DNI';
const textHintIdentificationTwo = 'ingrese su DNI nuevamente para validar';
const textLabelIdentificationTwo = 'DNI';
const textHintGradeRegister = "ingrese el número del año que cursa.";
const textLabelGradeRegister = "Curso";
const textDniInvalidDataFormat = 'Ingrese hasta 8 caracteres solamente del tipo numerico';
const textIdentificationInvalidDataFormat = 'Ingrese hasta 11 caracteres solamente del tipo numerico';
const textGradeInvalidDataFormat = "Debe ingresar solo un caracter del tipo numérico.";
const textHintRoleRegister = 'ingrese su role';
const textLabelRoleRegister = 'Role';
const textInvalidRole = 'El texto ingresado no es Admin ni Student.';
const textRegexPatternByDni = r'^[0-9]{2,50}$';
const textRegexPatternByString =  r'^[a-zA-Z]{2,50}$';
const textRegexPatternByStringWithNumber =  r'^[a-zA-Z0-9\s]{2,50}$';
const textInvalidDataFormat = 'El texto ingresado no es valido o tiene hasta 50 caracteres maximo';
const textResultErrorRegisterTitle = 'Resultado del Registro de Usuario';
const textResultInvalidDataRegister = 'Error en el proceso de registro. Incorrectos los datos. Vuelva a intentar.';
const textButtonShowDialogRegister = 'OK';
const textResultRegisterTitle = 'Resultado del Registro de Usuario';

const textRegisterPersonSuccess = 'Se ha registrado exitosamente. ';
const textHintTextPhoneRegister = 'ingrese su telefono';
const textLabelPhoneRegister = 'Telefono';
const textPhoneInvalidDataFormat = 'Ingrese hasta 15 caracteres solamente del tipo numerico';
const textRegexPatternByPhoneNumber = r'^[0-9]{1,50}$';

//Login
const textTitle = 'Login';
const textNewAccount = 'Crea una nueva cuenta';
const textChangePassword = 'Has olvidado tu contraseña?';
const textRestorePassword = 'Restablecer Contraseña';
const textLabelTitlePasswordOne = 'Primer Nueva Contraseña';
const textLabelTitlePasswordTwo = 'Repita Contraseña';
const textButtonActionRegister = 'Registrarse';
const textInvalidData = 'El valor ingresado no es un correo valido';
const textRegexPatternEmail = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const textFormatPassword = '*******';
const textLabelTitlePassword = 'Contraseña';
const textInvalidDataPassword = 'La contraseña debe de ser mayor o igual a 7 caracteres';
const textResultErrorLoginTitle = 'Resultado del Login';
const textResultInvalidDataLogin = 'Error en el proceso de login. Incorrecto password o su usuario no existe.';
const textButtonShowDialogLogin = 'OK';
const textYouEmail = 'tuCasillaDeEmail@gmail.com';
const textLabelTitleEmail = 'Correo electrónico';
const textYouDni = '11222333';
const textLabelTitleDni = 'DNI';
const textLabelTitleDniTwo = 'Ingrese el mismo DNI';
const textInvalidDni = 'El DNI ingresado no es correcto.';


//Mensajes capa Services
const logGetUserFailed = 'No se encuentra el usuario o ha fallado el traer su perfil';
const logDeleteProfileUserFailed = 'No pudo ser eliminado su Perfil y usuario.';
const logRegisterPublisherAuthenticationService = "Fallo el registro del publicador.";
const logLogoutFailedAuthenticationService = 'Fallo al intentar desloguearse.';
const logPostulateFailedApplicantService = "Fallo al postularse al aviso solicitado.";
const logLoginFailedAuthenticationService = "Fallo al intentar loguearse, revise su username y password.";
const logRegisterStudentAuthenticationService = "Fallo el registro del estudiante.";
const logJobOfferAllFailed = "Fallo traer la lista de Joboffers";
const logJobOfferApplicantFailed = "Fallo traer la lista de jobOfferApp";
const logNotModifiedProfile = 'No se ha podido modificar el perfil en la bd.';


//Profile
const textTitleProfile = 'Profile Person';
const textNoDataUserInitial = 'No tiene acceso ya que no está logueado. Diríjase a la opción Login.';
const textUnknownState = 'Estado no reconocido';
const textChangeProfileTitle = 'Change Profile Person';
const textButtonChangeName = 'Cambiar Nombre';
const textButtonChangeLastName = 'Cambiar Apellido';
const textButtonChangeDni = 'Cambiar Documento';
const textButtonChangePhone = 'Cambiar Teléfono';
const textButtonChangeEmail = 'Cambiar Email';
const textButtonChangeGrade = 'Cambiar Curso';
const textButtonDeleteUser = 'Darse de baja';
const textWriterNewChangeByVariable = 'Escriba su nuevo ';
const textSendDataButton = 'Enviar Cambios';
const textTitleResultChangeNotExists = 'Resultado de su solicitud: ';
const textTypeChangeNotExists = 'No existe lo solicitado';
const textButtonShowDialogProfile = 'OK';
const textGetUserSuccess = 'Se ha encontrado su perfil correctamente.';

//Forgot
const textTitleForgot = 'Restore Password';
const textResultForgotTitle = 'Resultado de Restaurar Contraseña';
const textButtonShowDialogForgot = 'OK';
const logForgotFailed = "Primer Contraseña es distinta a su repetición. Vuelva a intentarlo.";
const logForgotFailedBack = 'Ha fallado el intento de restaurar su contraseña, intenten nuevamente mas tarde.';

//DropdownButtonFormField
const textSelectedRoleInRegister = 'Seleccionar uno...';
const textSelectedEvalutaionJobOffer = 'Seleccionar un estado...';

//Welcome
const textWelcomeTitleAnimation = "Bienvenido a IBE RDR";
const textGoodByeTitleAnimation = "Hasta luego!";

//Main
const textTitleWebSite = 'Asistencia IBE-RDR';
const textInitialRouteApp = 'login';

//Title AppBar
const textTitleShopOfAdminHome = "Home";
const textTitleAppBarByHome = "Asistencia - IBE RDR";
const textTitleChangeProfile = 'Opciones de Cambio';
const textTitleSearching = 'Buscar contenga letra...';
const textTitleAppBarByApplicant = 'Menu Estudiante';
const textTitleAppBarByUtn = 'Menu Administrativo';
const textTitleAppBarRegister = 'Menu de Alta';
const textTitleAppBarDniChange = 'Menu Cambio de DNI';

//tooltip
const textToolTipLogout = 'Desloguearse';
const textToolTipSearch = 'Buscador';

//Drawer
const textWelcome = "Bienvenido: ";
const textWebSite = "APP: ";
const textWebSiteName = "Asistencia IBE RDR";
const textTypeVehiclesWebSite = "";
const textContactTitle = "Contacto: ";
const textContactPhone = "1122223333";
const textContactEmail = "ibereydereyes@gmail.com";
const textInitialsWebSiteName = 'IBE';
const textDarkModeTheme = 'Tema Color';
const textCustomModeTheme = 'Custom Theme';
const textLoginRegisterForgot = 'Login - Register - Forgot';
const textLoginRegister = 'Login - Register';
const textLogout = 'Salir';

//Assistance
const textTitleAssistanceScreen = "Pantalla de presentismo";
const textHintAssistanceDateFromAndTo = 'Formato año-mes-dia';
const textLabelAssistanceDateFrom = 'Fecha desde';
const textLabelAssistanceDateTo = 'Fecha hasta';

//Windows Text
const textTitleQrScanner = 'Scanear con QR';
const textTitleReportAdmin = 'Reporte de asistencias';