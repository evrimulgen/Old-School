object dmDocs: TdmDocs
  OldCreateOrder = False
  Height = 304
  Width = 803
  object dsDocs: TDataSource
    DataSet = adodsDocs
    Left = 15
    Top = 18
  end
  object adodsDocs: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = adodsDocsCalcFields
    OnFilterRecord = adodsDocsFilterRecord
    CommandText = 'select * from MagazineDocs'
    Parameters = <>
    Left = 12
    Top = 83
    object adodsDocsDateCreate: TDateTimeField
      FieldName = 'DateCreate'
    end
    object adodsDocsnCode: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object adodsDocsIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
      ReadOnly = True
    end
    object adodsDocsFIO: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object adodsDocsIk_grup: TIntegerField
      FieldName = 'Ik_grup'
    end
    object adodsDocsCname_grup: TStringField
      FieldName = 'Cname_grup'
      Size = 50
    end
    object adodsDocsIk_form_ed: TIntegerField
      FieldName = 'Ik_form_ed'
    end
    object adodsDocsCname_form_ed: TStringField
      FieldName = 'Cname_form_ed'
      Size = 50
    end
    object adodsDocsIk_fac: TIntegerField
      FieldName = 'Ik_fac'
    end
    object adodsDocsCname_fac: TStringField
      FieldName = 'Cname_fac'
      Size = 500
    end
    object adodsDocsik_spec: TIntegerField
      FieldName = 'ik_spec'
    end
    object adodsDocsCname_spec: TStringField
      FieldName = 'Cname_spec'
      Size = 300
    end
    object adodsDocsik_direction: TIntegerField
      FieldName = 'ik_direction'
    end
    object adodsDocscNameDestination: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
    object adodsDocsIk_Document: TIntegerField
      FieldName = 'Ik_Document'
    end
    object adodsDocsIk_destination: TIntegerField
      FieldName = 'Ik_destination'
    end
    object adodsDocscName_direction: TStringField
      FieldName = 'cName_direction'
      Size = 50
    end
    object adodsDocscNameTransfer: TStringField
      FieldName = 'cNameTransfer'
      Size = 50
    end
    object adodsDocsDateStartCallSpr: TWideStringField
      FieldName = 'DateStartCallSpr'
      Size = 10
    end
    object adodsDocsDateEndCallSpr: TWideStringField
      FieldName = 'DateEndCallSpr'
      Size = 10
    end
    object adodsDocsIk_Transfer: TIntegerField
      FieldName = 'Ik_Transfer'
    end
    object adodsDocsNumberDoc: TIntegerField
      FieldName = 'NumberDoc'
    end
    object adodsDocsDateReady: TDateTimeField
      FieldName = 'DateReady'
    end
    object adodsDocsNum_podrazd: TStringField
      FieldName = 'Num_podrazd'
      Size = 10
    end
    object adodsDocsPersName: TStringField
      FieldName = 'PersName'
      ReadOnly = True
      Size = 92
    end
    object adodsDocsStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
    object adodsDocsDatePod: TDateTimeField
      FieldName = 'DatePod'
    end
    object adodsDocsKol_day: TIntegerField
      FieldName = 'Kol_day'
      ReadOnly = True
    end
    object adodsDocscName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 500
    end
    object adodsDocsCstrana: TStringField
      FieldName = 'Cstrana'
      Size = 50
    end
    object adodsDocsaddr: TStringField
      FieldName = 'addr'
      ReadOnly = True
      Size = 280
    end
    object adodsDocsCname_pric: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object adodsDocsAddressTypeName: TStringField
      FieldName = 'AddressTypeName'
      Size = 50
    end
    object adodsDocsn_sem: TWordField
      FieldName = 'n_sem'
    end
    object adodsDocsStatosDoc: TStringField
      FieldName = 'StatusDoc'
      Size = 15
    end
  end
  object dsReviewDoc: TDataSource
    DataSet = adodsReviewDoc
    Left = 127
    Top = 18
  end
  object adodsReviewDoc: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select * from MagazineDocs'
    Parameters = <>
    Left = 124
    Top = 83
    object StringField2: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object IntegerField8: TIntegerField
      FieldName = 'Ik_destination'
    end
    object adodsReviewDoccNameDestination: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
    object adodsReviewDocIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
      ReadOnly = True
    end
    object adodsReviewDocIk_Document: TIntegerField
      FieldName = 'Ik_Document'
    end
  end
  object dsPricina: TDataSource
    DataSet = adodsPricina
    Left = 223
    Top = 18
  end
  object adodsPricina: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select * from ReasonForDestination'
    Parameters = <>
    Left = 228
    Top = 83
    object adodsPricinaIk_pric: TIntegerField
      FieldName = 'Ik_pric'
    end
    object adodsPricinaCname_pric: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object adodsPricinaShortCname_pric: TStringField
      FieldName = 'ShortCname_pric'
    end
    object adodsPricinaIk_reason_issuing: TIntegerField
      FieldName = 'Ik_reason_issuing'
    end
    object adodsPricinaIk_destination: TIntegerField
      FieldName = 'Ik_destination'
    end
    object adodsPricinacNameDestination: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
  end
  object dsStudAddres: TDataSource
    DataSet = adodsStudAddres
    Left = 327
    Top = 18
  end
  object adodsStudAddres: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select * from StudAddress'
    Parameters = <>
    Left = 324
    Top = 83
    object adodsStudAddresik_AddressType: TIntegerField
      FieldName = 'ik_AddressType'
    end
    object adodsStudAddresAddressTypeName: TStringField
      FieldName = 'AddressTypeName'
      Size = 50
    end
    object adodsStudAddresik_personAddress: TIntegerField
      FieldName = 'ik_personAddress'
    end
    object adodsStudAddresBuildingNumber: TStringField
      FieldName = 'BuildingNumber'
      Size = 10
    end
    object adodsStudAddresStructNumber: TStringField
      FieldName = 'StructNumber'
      Size = 10
    end
    object adodsStudAddresCStreet: TStringField
      FieldName = 'CStreet'
      Size = 100
    end
    object adodsStudAddrescshort_type_street: TStringField
      FieldName = 'cshort_type_street'
      Size = 50
    end
    object adodsStudAddresCType_Street: TStringField
      FieldName = 'CType_Street'
      Size = 50
    end
    object adodsStudAddresCgorod: TStringField
      FieldName = 'Cgorod'
      Size = 50
    end
    object adodsStudAddresCIndex: TStringField
      FieldName = 'CIndex'
    end
    object adodsStudAddrescshort_type_gorod: TStringField
      FieldName = 'cshort_type_gorod'
      Size = 10
    end
    object adodsStudAddresctype_gorod: TStringField
      FieldName = 'ctype_gorod'
      Size = 50
    end
    object adodsStudAddresCraion: TStringField
      FieldName = 'Craion'
      Size = 50
    end
    object adodsStudAddresCregion: TStringField
      FieldName = 'Cregion'
      Size = 50
    end
    object adodsStudAddresCstrana: TStringField
      FieldName = 'Cstrana'
      Size = 50
    end
    object adodsStudAddresbit_SNG: TBooleanField
      FieldName = 'bit_SNG'
    end
    object adodsStudAddresIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
    end
    object adodsStudAddresFlatNumber: TStringField
      FieldName = 'FlatNumber'
      Size = 10
    end
  end
  object dsVisa: TDataSource
    DataSet = adodsVisa
    Left = 31
    Top = 162
  end
  object adodsVisa: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = adodsDocsCalcFields
    CommandText = 'select * from MagazineDocs'
    Parameters = <>
    Left = 28
    Top = 227
    object DateTimeField1: TDateTimeField
      FieldName = 'DateCreate'
    end
    object BCDField1: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object IntegerField1: TIntegerField
      FieldName = 'Ik_studGrup'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object IntegerField2: TIntegerField
      FieldName = 'Ik_grup'
    end
    object StringField3: TStringField
      FieldName = 'Cname_grup'
      Size = 50
    end
    object IntegerField3: TIntegerField
      FieldName = 'Ik_form_ed'
    end
    object StringField4: TStringField
      FieldName = 'Cname_form_ed'
      Size = 50
    end
    object IntegerField4: TIntegerField
      FieldName = 'Ik_fac'
    end
    object StringField5: TStringField
      FieldName = 'Cname_fac'
      Size = 500
    end
    object IntegerField5: TIntegerField
      FieldName = 'ik_spec'
    end
    object StringField6: TStringField
      FieldName = 'Cname_spec'
      Size = 300
    end
    object IntegerField6: TIntegerField
      FieldName = 'ik_direction'
    end
    object StringField7: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
    object IntegerField7: TIntegerField
      FieldName = 'Ik_Document'
    end
    object IntegerField9: TIntegerField
      FieldName = 'Ik_destination'
    end
    object StringField8: TStringField
      FieldName = 'cName_direction'
      Size = 50
    end
    object StringField9: TStringField
      FieldName = 'cNameTransfer'
      Size = 50
    end
    object StringField10: TStringField
      FieldName = 'cName_type_disc'
      Size = 30
    end
    object WideStringField1: TWideStringField
      FieldName = 'DateStartCallSpr'
      Size = 10
    end
    object WideStringField2: TWideStringField
      FieldName = 'DateEndCallSpr'
      Size = 10
    end
    object IntegerField10: TIntegerField
      FieldName = 'Ik_Transfer'
    end
    object WordField1: TWordField
      FieldName = 'ik_type_disc'
    end
    object IntegerField11: TIntegerField
      FieldName = 'NumberDoc'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DateReady'
    end
    object StringField11: TStringField
      FieldName = 'Num_podrazd'
      Size = 10
    end
    object StringField12: TStringField
      FieldName = 'PersName'
      ReadOnly = True
      Size = 92
    end
    object StringField13: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
  end
  object dsOsn: TDataSource
    DataSet = spOsn
    Left = 184
    Top = 232
  end
  object spOsn: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'FindBaseDoc;1'
    Parameters = <>
    Left = 184
    Top = 176
  end
  object adodsNeusp: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select * from SprAkadem'
    Parameters = <>
    Left = 260
    Top = 235
    object adodsNeuspIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
    end
    object adodsNeuspik_upContent: TIntegerField
      FieldName = 'ik_upContent'
    end
    object adodsNeuspcName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 500
    end
    object adodsNeuspcName_vid_zanyat: TStringField
      FieldName = 'cName_vid_zanyat'
      Size = 50
    end
    object adodsNeuspn_sem: TWordField
      FieldName = 'n_sem'
    end
    object adodsNeuspflag: TBooleanField
      FieldName = 'flag'
    end
  end
  object dsNeusp: TDataSource
    DataSet = adodsNeusp
    Left = 263
    Top = 178
  end
  object dsDestination: TDataSource
    DataSet = adodsDestination
    Left = 343
    Top = 170
  end
  object adodsDestination: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = adodsDocsCalcFields
    CommandText = 'select * from  Destination'
    Parameters = <>
    Left = 340
    Top = 235
    object adodsDestinationIk_destination: TAutoIncField
      FieldName = 'Ik_destination'
      ReadOnly = True
    end
    object adodsDestinationcNameDestination: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
    object adodsDestinationcShortNameDestination: TStringField
      FieldName = 'cShortNameDestination'
      Size = 50
    end
    object adodsDestinationDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
    end
    object adodsDestinationik_typesup: TIntegerField
      FieldName = 'ik_typesup'
    end
    object adodsDestinationBase: TBooleanField
      FieldName = 'Base'
    end
  end
  object adodsDocStud: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = adodsDocStudCalcFields
    CommandText = 'select * from MagazineDocs'
    Parameters = <>
    Left = 100
    Top = 227
    object DateTimeField3: TDateTimeField
      FieldName = 'DateCreate'
    end
    object BCDField2: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object IntegerField12: TIntegerField
      FieldName = 'Ik_studGrup'
      ReadOnly = True
    end
    object StringField14: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object IntegerField13: TIntegerField
      FieldName = 'Ik_grup'
    end
    object StringField15: TStringField
      FieldName = 'Cname_grup'
      Size = 50
    end
    object IntegerField14: TIntegerField
      FieldName = 'Ik_form_ed'
    end
    object StringField16: TStringField
      FieldName = 'Cname_form_ed'
      Size = 50
    end
    object IntegerField15: TIntegerField
      FieldName = 'Ik_fac'
    end
    object StringField17: TStringField
      FieldName = 'Cname_fac'
      Size = 500
    end
    object IntegerField16: TIntegerField
      FieldName = 'ik_spec'
    end
    object StringField18: TStringField
      FieldName = 'Cname_spec'
      Size = 300
    end
    object IntegerField17: TIntegerField
      FieldName = 'ik_direction'
    end
    object StringField19: TStringField
      FieldName = 'cNameDestination'
      Size = 50
    end
    object IntegerField18: TIntegerField
      FieldName = 'Ik_Document'
    end
    object IntegerField19: TIntegerField
      FieldName = 'Ik_destination'
    end
    object StringField20: TStringField
      FieldName = 'cName_direction'
      Size = 50
    end
    object StringField21: TStringField
      FieldName = 'cNameTransfer'
      Size = 50
    end
    object WideStringField3: TWideStringField
      FieldName = 'DateStartCallSpr'
      Size = 10
    end
    object WideStringField4: TWideStringField
      FieldName = 'DateEndCallSpr'
      Size = 10
    end
    object IntegerField20: TIntegerField
      FieldName = 'Ik_Transfer'
    end
    object IntegerField21: TIntegerField
      FieldName = 'NumberDoc'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DateReady'
    end
    object StringField23: TStringField
      FieldName = 'Num_podrazd'
      Size = 10
    end
    object StringField24: TStringField
      FieldName = 'PersName'
      ReadOnly = True
      Size = 92
    end
    object StringField25: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Calculated = True
    end
    object adodsDocStudDatePod: TDateTimeField
      FieldName = 'DatePod'
    end
    object adodsDocStudcName_disc: TStringField
      FieldName = 'cName_disc'
      Size = 500
    end
    object adodsDocStudKol_day: TIntegerField
      FieldName = 'Kol_day'
      ReadOnly = True
    end
    object adodsDocStudCstrana: TStringField
      FieldName = 'Cstrana'
      Size = 50
    end
    object adodsDocStudaddr: TStringField
      FieldName = 'addr'
      ReadOnly = True
      Size = 280
    end
    object adodsDocStudCname_pric: TStringField
      FieldName = 'Cname_pric'
      Size = 50
    end
    object adodsDocStudAddressTypeName: TStringField
      FieldName = 'AddressTypeName'
      Size = 50
    end
    object adodsDocStudn_sem: TWordField
      FieldName = 'n_sem'
    end
    object adodsDocStudStatusDoc: TStringField
      FieldName = 'StatusDoc'
      Size = 15
    end
  end
  object dsDocStud: TDataSource
    DataSet = adodsDocStud
    Left = 95
    Top = 170
  end
  object spDest: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'DestForStud;1'
    Parameters = <>
    Left = 424
    Top = 168
  end
  object dsDest: TDataSource
    DataSet = spDest
    Left = 416
    Top = 232
  end
  object spStudAddressProc: TADOStoredProc
    Connection = dm.DBConnect
    ProcedureName = 'StudAddressProc;1'
    Parameters = <>
    Left = 456
    Top = 16
  end
  object dsStudAddressProc: TDataSource
    DataSet = spStudAddressProc
    Left = 448
    Top = 88
  end
  object dsAddr: TDataSource
    DataSet = spAddr
    Left = 503
    Top = 170
  end
  object spAddr: TADOStoredProc
    ProcedureName = 'AllAddrStudInGroup;1'
    Parameters = <>
    Left = 496
    Top = 240
  end
  object dsStudGrup: TDataSource
    DataSet = adodsStudGrup
    Left = 567
    Top = 170
  end
  object adodsStudGrup: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = spAddrCalcFields
    CommandText = 'select * from  ViewGroupStud'
    Parameters = <>
    Left = 588
    Top = 235
    object adodsStudGrupStudAddr: TStringField
      FieldKind = fkCalculated
      FieldName = 'StudAddr'
      Size = 1000
      Calculated = True
    end
    object adodsStudGrupPersonFullName: TStringField
      FieldName = 'PersonFullName'
      ReadOnly = True
      Size = 92
    end
    object adodsStudGrupPersonSmallName: TStringField
      FieldName = 'PersonSmallName'
      ReadOnly = True
      Size = 34
    end
    object adodsStudGrupnCode: TBCDField
      FieldName = 'nCode'
      Precision = 18
      Size = 0
    end
    object adodsStudGrupik_zach: TIntegerField
      FieldName = 'ik_zach'
    end
    object adodsStudGrupik_kat_zach: TIntegerField
      FieldName = 'ik_kat_zach'
    end
    object adodsStudGrupIk_studGrup: TIntegerField
      FieldName = 'Ik_studGrup'
    end
    object adodsStudGrupIk_grup: TIntegerField
      FieldName = 'Ik_grup'
    end
    object adodsStudGrupik_persAddr: TIntegerField
      FieldName = 'ik_persAddr'
      ReadOnly = True
    end
    object adodsStudGrupAddrType: TStringField
      FieldKind = fkLookup
      FieldName = 'AddressTypeName'
      LookupDataSet = adodsTypeAddr
      LookupKeyFields = 'ik_AddressType'
      LookupResultField = 'AddressTypeName'
      KeyFields = 'ik_AddressType'
      Size = 100
      Lookup = True
    end
    object adodsStudGrupik_AddressType: TIntegerField
      FieldName = 'ik_AddressType'
    end
  end
  object dsTypeAddr: TDataSource
    DataSet = adodsTypeAddr
    Left = 655
    Top = 170
  end
  object adodsTypeAddr: TADODataSet
    Connection = dm.DBConnect
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 'select *  from AddressType'
    Parameters = <>
    Left = 684
    Top = 235
    object adodsTypeAddrik_AddressType: TAutoIncField
      FieldName = 'ik_AddressType'
      ReadOnly = True
    end
    object adodsTypeAddrAddressTypeName: TStringField
      FieldName = 'AddressTypeName'
      Size = 50
    end
    object adodsTypeAddrIsFirst: TBooleanField
      FieldName = 'IsFirst'
    end
  end
end
