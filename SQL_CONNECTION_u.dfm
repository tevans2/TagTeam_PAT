object Demonstration: TDemonstration
  Left = 0
  Top = 0
  Caption = 'Demonstration'
  ClientHeight = 561
  ClientWidth = 871
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object executeButton: TButton
    Left = 328
    Top = 256
    Width = 201
    Height = 25
    Caption = 'Execute'
    TabOrder = 0
    OnClick = executeButtonClick
  end
  object connectButton: TButton
    Left = 112
    Top = 256
    Width = 201
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = connectButtonClick
  end
  object outputMemo: TMemo
    Left = 112
    Top = 32
    Width = 417
    Height = 218
    TabOrder = 2
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Sqlite'
    Params.Strings = (
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver260.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver260.bpl'
      'FailIfMissing=True'
      'Database=')
    Left = 128
    Top = 312
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 208
    Top = 312
  end
  object DataSource1: TDataSource
    DataSet = SQLQuery1
    Left = 280
    Top = 312
  end
end
