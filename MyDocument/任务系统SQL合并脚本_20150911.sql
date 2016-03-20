---------------------------�����ֵ����ɹ���(V2.5)--------------------------------
GO
IF NOT EXISTS(SELECT 1 FROM sysobjects WHERE id=OBJECT_ID('[p_IPProxy]'))
BEGIN
/*==============================================================*/
/* Table: p_IPProxy                                              */
/*==============================================================*/
CREATE TABLE [dbo].[p_IPProxy](
	[ProxyGuid] uniqueidentifier  NOT NULL  DEFAULT newsequentialid() ,
	[Country] nvarchar(50)   ,
	[IP] nvarchar(100)   ,
	[Port] nvarchar(10)   ,
	[ProxyIp] nvarchar(110)   ,
	[Position] nvarchar(100)   ,
	[Anonymity] nvarchar(20)   ,
	[Type] nvarchar(20)   ,
	[Speed] varchar(20)   ,
	[ConnectTime] varchar(20)   ,
	[VerifyTime] varchar(20)   ,
	PRIMARY KEY(ProxyGuid)
)
	

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 'ip����','user', @CurrentUser, 'table', 'p_IPProxy'
execute sp_addextendedproperty 'MS_Description',  '����GUID' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'ProxyGuid'
execute sp_addextendedproperty 'MS_Description',  '���Ҽ��' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'Country'
execute sp_addextendedproperty 'MS_Description',  'ip�����ַ' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'IP'
execute sp_addextendedproperty 'MS_Description',  '����˿�' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'Port'
execute sp_addextendedproperty 'MS_Description',  '����ip(�����˿�)' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'ProxyIp'
execute sp_addextendedproperty 'MS_Description',  'ipλ��' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'Position'
execute sp_addextendedproperty 'MS_Description',  '��������' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'Anonymity'
execute sp_addextendedproperty 'MS_Description',  'http����' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'Type'
execute sp_addextendedproperty 'MS_Description',  '�����ٶ�' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'Speed'
execute sp_addextendedproperty 'MS_Description',  '����ʱ��' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'ConnectTime'
execute sp_addextendedproperty 'MS_Description',  '��֤ʱ��' ,'user', @CurrentUser, 'table', 'p_IPProxy', 'column', 'VerifyTime'

END
GO

---------------------------�����ֵ����ɹ���(V2.5)--------------------------------
GO
IF NOT EXISTS(SELECT 1 FROM sysobjects WHERE id=OBJECT_ID('[p_ProxyIPUseHistory]'))
BEGIN
/*==============================================================*/
/* Table: p_ProxyIPUseHistory                                              */
/*==============================================================*/
CREATE TABLE [dbo].[p_ProxyIPUseHistory](
	[ProxyIPHistoryGuid] uniqueidentifier  NOT NULL  DEFAULT newsequentialid() ,
	[ProxyIP] nvarchar(50)   ,
	[CreatedOn] datetime DEFAULT GETDATE(),
	[CreateDay] nvarchar(10) DEFAULT convert(varchar(10),GETDATE(),120),
	[Type] nvarchar(50), 
	PRIMARY KEY(ProxyIPHistoryGuid)
)
	

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '����IPʹ����ʷ��¼','user', @CurrentUser, 'table', 'p_ProxyIPUseHistory'
execute sp_addextendedproperty 'MS_Description',  '����IPʹ����ʷ��¼GUID' ,'user', @CurrentUser, 'table', 'p_ProxyIPUseHistory', 'column', 'ProxyIPHistoryGuid'
execute sp_addextendedproperty 'MS_Description',  '����ip(�����˿�)' ,'user', @CurrentUser, 'table', 'p_ProxyIPUseHistory', 'column', 'ProxyIp'
execute sp_addextendedproperty 'MS_Description',  '����ʱ��' ,'user', @CurrentUser, 'table', 'p_ProxyIPUseHistory', 'column', 'CreatedOn'
execute sp_addextendedproperty 'MS_Description',  '��������(������)' ,'user', @CurrentUser, 'table', 'p_ProxyIPUseHistory', 'column', 'CreateDay'
execute sp_addextendedproperty 'MS_Description',  '����������ʶ���ĸ�ģ��ʹ��' ,'user', @CurrentUser, 'table', 'p_ProxyIPUseHistory', 'column', 'Type'

END
GO

---------------------------�����ֵ����ɹ���(V2.5)--------------------------------
GO
IF NOT EXISTS(SELECT 1 FROM sysobjects WHERE id=OBJECT_ID('[p_ExpressCompany]'))
BEGIN
/*==============================================================*/
/* Table: p_ExpressCompany                                              */
/*==============================================================*/
CREATE TABLE [dbo].[p_ExpressCompany](
	[CompanyGUID] uniqueidentifier  NOT NULL  DEFAULT newsequentialid() ,
	[CompanyName] nvarchar(100)   ,
	[CompanyCode] nvarchar(100)   ,
	[CreatedOn] datetime   DEFAULT getdate() ,
	PRIMARY KEY(CompanyGUID)
)
	

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '��ݹ�˾��Ϣ','user', @CurrentUser, 'table', 'p_ExpressCompany'
execute sp_addextendedproperty 'MS_Description',  '��ݹ�˾GUID' ,'user', @CurrentUser, 'table', 'p_ExpressCompany', 'column', 'CompanyGUID'
execute sp_addextendedproperty 'MS_Description',  '��ݹ�˾����' ,'user', @CurrentUser, 'table', 'p_ExpressCompany', 'column', 'CompanyName'
execute sp_addextendedproperty 'MS_Description',  '��ݹ�˾���' ,'user', @CurrentUser, 'table', 'p_ExpressCompany', 'column', 'CompanyCode'
execute sp_addextendedproperty 'MS_Description',  '��������' ,'user', @CurrentUser, 'table', 'p_ExpressCompany', 'column', 'CreatedOn'

END
GO

/****��ʼ����ݹ�˾����*****/
GO
IF NOT EXISTS(SELECT 1 FROM dbo.p_ExpressCompany)
BEGIN
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'6956f12f-a254-e511-8d70-00155d0c740d', N'Բͨ���', N'yuantong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'6a56f12f-a254-e511-8d70-00155d0c740d', N'��ͨ���', N'shentong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'6b56f12f-a254-e511-8d70-00155d0c740d', N'˳����', N'shunfeng')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'6c56f12f-a254-e511-8d70-00155d0c740d', N'�ϴ���', N'yunda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'6d56f12f-a254-e511-8d70-00155d0c740d', N'�°�����', N'debangwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'6e56f12f-a254-e511-8d70-00155d0c740d', N'��ͨ���', N'zhongtong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'6f56f12f-a254-e511-8d70-00155d0c740d', N'������ͨ', N'huitongkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7056f12f-a254-e511-8d70-00155d0c740d', N'��������', N'youzhengguonei')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7156f12f-a254-e511-8d70-00155d0c740d', N'EMS', N'ems')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7256f12f-a254-e511-8d70-00155d0c740d', N'��������', N'annengwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7356f12f-a254-e511-8d70-00155d0c740d', N'��Ѹ����', N'anxl')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7456f12f-a254-e511-8d70-00155d0c740d', N'����/ƽ��/�Һ���', N'youzhengguonei')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7556f12f-a254-e511-8d70-00155d0c740d', N'����֧���', N'balunzhi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7656f12f-a254-e511-8d70-00155d0c740d', N'����С��ñ', N'xiaohongmao')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7756f12f-a254-e511-8d70-00155d0c740d', N'������ͨ', N'huitongkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7856f12f-a254-e511-8d70-00155d0c740d', N'�ٸ���������', N'baifudongfang')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7956f12f-a254-e511-8d70-00155d0c740d', N'��������', N'bangsongwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7a56f12f-a254-e511-8d70-00155d0c740d', N'��������', N'lbbk')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7b56f12f-a254-e511-8d70-00155d0c740d', N'��ǧ������', N'bqcwl')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7c56f12f-a254-e511-8d70-00155d0c740d', N'��Դ��ͨ', N'byht')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7d56f12f-a254-e511-8d70-00155d0c740d', N'COE��������ݣ�', N'coe')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7e56f12f-a254-e511-8d70-00155d0c740d', N'����100', N'city100')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'7f56f12f-a254-e511-8d70-00155d0c740d', N'��ϲ����', N'chuanxiwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8056f12f-a254-e511-8d70-00155d0c740d', N'�Ǽ��ٵ�', N'chengjisudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8156f12f-a254-e511-8d70-00155d0c740d', N'�ɶ�������', N'lijisong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8256f12f-a254-e511-8d70-00155d0c740d', N'������', N'chukou1')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8356f12f-a254-e511-8d70-00155d0c740d', N'DHL��ݣ��й�����', N'dhl')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8456f12f-a254-e511-8d70-00155d0c740d', N'DHL�����ʼ���', N'dhlen')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8556f12f-a254-e511-8d70-00155d0c740d', N'DHL���¹�����', N'dhlde')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8656f12f-a254-e511-8d70-00155d0c740d', N'�°�', N'debangwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8756f12f-a254-e511-8d70-00155d0c740d', N'��������', N'datianwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8856f12f-a254-e511-8d70-00155d0c740d', N'�������', N'coe')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8956f12f-a254-e511-8d70-00155d0c740d', N'���ķ�', N'disifang')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8a56f12f-a254-e511-8d70-00155d0c740d', N'��������', N'dayangwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8b56f12f-a254-e511-8d70-00155d0c740d', N'��ͨ���', N'diantongkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8c56f12f-a254-e511-8d70-00155d0c740d', N'�´�����', N'dechuangwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8d56f12f-a254-e511-8d70-00155d0c740d', N'��������', N'donghong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8e56f12f-a254-e511-8d70-00155d0c740d', N'D������', N'dsukuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'8f56f12f-a254-e511-8d70-00155d0c740d', N'�������', N'donghanwl')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9056f12f-a254-e511-8d70-00155d0c740d', N'�﷽����', N'dfpost')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9156f12f-a254-e511-8d70-00155d0c740d', N'EMS��ݲ�ѯ', N'ems')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9256f12f-a254-e511-8d70-00155d0c740d', N'EMS���ʿ�ݲ�ѯ', N'emsguoji')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9356f12f-a254-e511-8d70-00155d0c740d', N'FedEx��ݲ�ѯ', N'fedex')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9456f12f-a254-e511-8d70-00155d0c740d', N'FedEx���ʼ�', N'fedex')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9556f12f-a254-e511-8d70-00155d0c740d', N'FedEx��������', N'fedexus')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9656f12f-a254-e511-8d70-00155d0c740d', N'��������', N'rufengda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9756f12f-a254-e511-8d70-00155d0c740d', N'�ɿ�������', N'feikangda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9856f12f-a254-e511-8d70-00155d0c740d', N'�ɱ����', N'feibaokuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9956f12f-a254-e511-8d70-00155d0c740d', N'�ɺ����', N'feihukuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9a56f12f-a254-e511-8d70-00155d0c740d', N'�����ٵ�', N'fanyukuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9b56f12f-a254-e511-8d70-00155d0c740d', N'�c�����', N'fandaguoji')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9c56f12f-a254-e511-8d70-00155d0c740d', N'��Զ����', N'feiyuanvipshop')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9d56f12f-a254-e511-8d70-00155d0c740d', N'��ͨ���', N'guotongkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9e56f12f-a254-e511-8d70-00155d0c740d', N'�����ʼ���ѯ', N'youzhengguoji')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'9f56f12f-a254-e511-8d70-00155d0c740d', N'�����ܴ�����', N'ganzhongnengda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a056f12f-a254-e511-8d70-00155d0c740d', N'�Һ���/�����ʼ�', N'youzhengguonei')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a156f12f-a254-e511-8d70-00155d0c740d', N'���ٴ�', N'gongsuda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a256f12f-a254-e511-8d70-00155d0c740d', N'��ͨ�ٵ�', N'gtongsudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a356f12f-a254-e511-8d70-00155d0c740d', N'�ۿ��ٵ�', N'gdkd')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a456f12f-a254-e511-8d70-00155d0c740d', N'GATI���', N'gaticn')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a556f12f-a254-e511-8d70-00155d0c740d', N'�����ٵ�', N'hre')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a656f12f-a254-e511-8d70-00155d0c740d', N'�ڴ���', N'gda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a756f12f-a254-e511-8d70-00155d0c740d', N'��������', N'tiandihuayu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a856f12f-a254-e511-8d70-00155d0c740d', N'��·����', N'hengluwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'a956f12f-a254-e511-8d70-00155d0c740d', N'�����˿��', N'hlyex')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'aa56f12f-a254-e511-8d70-00155d0c740d', N'����������', N'huaxialongwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ab56f12f-a254-e511-8d70-00155d0c740d', N'��������', N'tiantian')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ac56f12f-a254-e511-8d70-00155d0c740d', N'�ӱ�����', N'hebeijianhua')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ad56f12f-a254-e511-8d70-00155d0c740d', N'�����ٵ�', N'haimengsudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ae56f12f-a254-e511-8d70-00155d0c740d', N'�������', N'huaqikuaiyun')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'af56f12f-a254-e511-8d70-00155d0c740d', N'�ʢ����', N'haoshengwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b056f12f-a254-e511-8d70-00155d0c740d', N'��ͨ����', N'hutongwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b156f12f-a254-e511-8d70-00155d0c740d', N'�������', N'hzpl')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b256f12f-a254-e511-8d70-00155d0c740d', N'����׿��', N'huangmajia')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b356f12f-a254-e511-8d70-00155d0c740d', N'�����ٵݣ�UCS��', N'ucs')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b456f12f-a254-e511-8d70-00155d0c740d', N'�ʼ�����', N'pfcexpress')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b556f12f-a254-e511-8d70-00155d0c740d', N'�������', N'huoban')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b656f12f-a254-e511-8d70-00155d0c740d', N'�Ѽ�����', N'jiajiwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b756f12f-a254-e511-8d70-00155d0c740d', N'��������', N'jiayiwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b856f12f-a254-e511-8d70-00155d0c740d', N'���������', N'jiayunmeiwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'b956f12f-a254-e511-8d70-00155d0c740d', N'���ȴ�����', N'jixianda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ba56f12f-a254-e511-8d70-00155d0c740d', N'�����ٵݿ��', N'jinguangsudikuaijian')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'bb56f12f-a254-e511-8d70-00155d0c740d', N'��Խ���', N'jinyuekuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'bc56f12f-a254-e511-8d70-00155d0c740d', N'�������', N'jd')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'bd56f12f-a254-e511-8d70-00155d0c740d', N'���ؿ��', N'jietekuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'be56f12f-a254-e511-8d70-00155d0c740d', N'���׿��', N'jiuyicn')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'bf56f12f-a254-e511-8d70-00155d0c740d', N'��ݿ��', N'kuaijiesudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c056f12f-a254-e511-8d70-00155d0c740d', N'��������', N'kangliwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c156f12f-a254-e511-8d70-00155d0c740d', N'��Խ����', N'kuayue')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c256f12f-a254-e511-8d70-00155d0c740d', N'���Ŵ��ٵ�', N'kuaiyouda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c356f12f-a254-e511-8d70-00155d0c740d', N'���Կ��', N'kuaitao')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c456f12f-a254-e511-8d70-00155d0c740d', N'�����ݣ����ڣ�', N'lianbangkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c556f12f-a254-e511-8d70-00155d0c740d', N'���ͨ����', N'lianhaowuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c656f12f-a254-e511-8d70-00155d0c740d', N'�����ٵ�', N'longbanwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c756f12f-a254-e511-8d70-00155d0c740d', N'�ֽݵ�', N'lejiedi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c856f12f-a254-e511-8d70-00155d0c740d', N'������', N'lijisong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'c956f12f-a254-e511-8d70-00155d0c740d', N'�������', N'lanhukuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ca56f12f-a254-e511-8d70-00155d0c740d', N'�񺽿��', N'minghangkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'cb56f12f-a254-e511-8d70-00155d0c740d', N'�������', N'meiguokuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'cc56f12f-a254-e511-8d70-00155d0c740d', N'�Ŷ���', N'menduimen')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'cd56f12f-a254-e511-8d70-00155d0c740d', N'��������', N'mingliangwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ce56f12f-a254-e511-8d70-00155d0c740d', N'����ٵ�', N'minbangsudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'cf56f12f-a254-e511-8d70-00155d0c740d', N'��ʢ���', N'minshengkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd056f12f-a254-e511-8d70-00155d0c740d', N'�ܴ��ٵ�', N'ganzhongnengda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd156f12f-a254-e511-8d70-00155d0c740d', N'ټ�ǰ¹���', N'nuoyaao')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd256f12f-a254-e511-8d70-00155d0c740d', N'�Ͼ��ɰ�����', N'nanjingshengbang')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd356f12f-a254-e511-8d70-00155d0c740d', N'ƽ�����ڷ�', N'pingandatengfei')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd456f12f-a254-e511-8d70-00155d0c740d', N'��������', N'peixingwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd556f12f-a254-e511-8d70-00155d0c740d', N'ȫ����', N'quanfengkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd656f12f-a254-e511-8d70-00155d0c740d', N'ȫһ���', N'quanyikuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd756f12f-a254-e511-8d70-00155d0c740d', N'ȫ��ͨ���', N'quanritongkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd856f12f-a254-e511-8d70-00155d0c740d', N'ȫ�����', N'quanchenkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'd956f12f-a254-e511-8d70-00155d0c740d', N'7����������', N'sevendays')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'da56f12f-a254-e511-8d70-00155d0c740d', N'������', N'rufengda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'db56f12f-a254-e511-8d70-00155d0c740d', N'��������', N'riyuwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'dc56f12f-a254-e511-8d70-00155d0c740d', N'��ͨ���', N'shentong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'dd56f12f-a254-e511-8d70-00155d0c740d', N'˳������', N'shunfeng')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'de56f12f-a254-e511-8d70-00155d0c740d', N'�ٶ����', N'suer')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'df56f12f-a254-e511-8d70-00155d0c740d', N'ɽ������', N'haihongwangsong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e056f12f-a254-e511-8d70-00155d0c740d', N'ʢ������', N'shenghuiwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e156f12f-a254-e511-8d70-00155d0c740d', N'���˿��', N'shiyunkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e256f12f-a254-e511-8d70-00155d0c740d', N'ʢ������', N'shengfengwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e356f12f-a254-e511-8d70-00155d0c740d', N'�ϴ�����', N'shangda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e456f12f-a254-e511-8d70-00155d0c740d', N'��̬�ٵ�', N'santaisudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e556f12f-a254-e511-8d70-00155d0c740d', N'���ĵ�', N'saiaodi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e656f12f-a254-e511-8d70-00155d0c740d', N'��ͨE����', N'shentong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e756f12f-a254-e511-8d70-00155d0c740d', N'ʥ������', N'shenganwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e856f12f-a254-e511-8d70-00155d0c740d', N'ɽ�������', N'sxhongmajia')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'e956f12f-a254-e511-8d70-00155d0c740d', N'�������', N'suijiawuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ea56f12f-a254-e511-8d70-00155d0c740d', N'�����ѻݶ�', N'syjiahuier')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'eb56f12f-a254-e511-8d70-00155d0c740d', N'�Ϻ��ֵ�����', N'shlindao')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ec56f12f-a254-e511-8d70-00155d0c740d', N'TNT���', N'tnt')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ed56f12f-a254-e511-8d70-00155d0c740d', N'������', N'tiantian')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ee56f12f-a254-e511-8d70-00155d0c740d', N'��ػ���', N'tiandihuayu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ef56f12f-a254-e511-8d70-00155d0c740d', N'ͨ������', N'tonghetianxia')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f056f12f-a254-e511-8d70-00155d0c740d', N'��������', N'tianzong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f156f12f-a254-e511-8d70-00155d0c740d', N'UPS��ݲ�ѯ', N'ups')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f256f12f-a254-e511-8d70-00155d0c740d', N'UPS���ʿ��', N'ups')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f356f12f-a254-e511-8d70-00155d0c740d', N'UC���ٿ��', N'youshuwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f456f12f-a254-e511-8d70-00155d0c740d', N'USPS��������', N'usps')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f556f12f-a254-e511-8d70-00155d0c740d', N'��������', N'wanxiangwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f656f12f-a254-e511-8d70-00155d0c740d', N'΢����', N'weitepai')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f756f12f-a254-e511-8d70-00155d0c740d', N'�������', N'wanjiawuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f856f12f-a254-e511-8d70-00155d0c740d', N'ϣ���ؿ��', N'xiyoutekuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'f956f12f-a254-e511-8d70-00155d0c740d', N'�°�����', N'xinbangwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'fa56f12f-a254-e511-8d70-00155d0c740d', N'�ŷ�����', N'xinfengwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'fb56f12f-a254-e511-8d70-00155d0c740d', N'�µ�����', N'neweggozzo')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'fc56f12f-a254-e511-8d70-00155d0c740d', N'������ͨ����', N'xianglongyuntong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'fd56f12f-a254-e511-8d70-00155d0c740d', N'���������ٵ�', N'xianchengliansudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'fe56f12f-a254-e511-8d70-00155d0c740d', N'����ϲ�����', N'xilaikd')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'ff56f12f-a254-e511-8d70-00155d0c740d', N'Բͨ�ٵ�', N'yuantong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0057f12f-a254-e511-8d70-00155d0c740d', N'�ϴ����', N'yunda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0157f12f-a254-e511-8d70-00155d0c740d', N'��ͨ���', N'yuntongkuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0257f12f-a254-e511-8d70-00155d0c740d', N'��������', N'youzhengguonei')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0357f12f-a254-e511-8d70-00155d0c740d', N'��������', N'youzhengguoji')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0457f12f-a254-e511-8d70-00155d0c740d', N'Զ������', N'yuanchengwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0557f12f-a254-e511-8d70-00155d0c740d', N'�Ƿ��ٵ�', N'yafengsudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0657f12f-a254-e511-8d70-00155d0c740d', N'���ٿ��', N'youshuwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0757f12f-a254-e511-8d70-00155d0c740d', N'��˳��', N'yishunhang')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0857f12f-a254-e511-8d70-00155d0c740d', N'Խ������', N'yuefengwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0957f12f-a254-e511-8d70-00155d0c740d', N'Դ������', N'yuananda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0a57f12f-a254-e511-8d70-00155d0c740d', N'ԭ�ɺ�����', N'yuanfeihangwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0b57f12f-a254-e511-8d70-00155d0c740d', N'����EMS�ٵ�', N'ems')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0c57f12f-a254-e511-8d70-00155d0c740d', N'�����ٵ�', N'yinjiesudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0d57f12f-a254-e511-8d70-00155d0c740d', N'һͳ�ɺ�', N'yitongfeihong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0e57f12f-a254-e511-8d70-00155d0c740d', N'��������', N'yuxinwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'0f57f12f-a254-e511-8d70-00155d0c740d', N'��ͨ��', N'yitongda')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1057f12f-a254-e511-8d70-00155d0c740d', N'�ʱؼ�', N'youbijia')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1157f12f-a254-e511-8d70-00155d0c740d', N'һ������', N'yiqiguojiwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1257f12f-a254-e511-8d70-00155d0c740d', N'���ؿ���', N'yinsu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1357f12f-a254-e511-8d70-00155d0c740d', N'��������', N'yilingsuyun')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1457f12f-a254-e511-8d70-00155d0c740d', N'�ϼ�����', N'yujiawuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1557f12f-a254-e511-8d70-00155d0c740d', N'Ӣ������', N'gml')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1657f12f-a254-e511-8d70-00155d0c740d', N'�Ʊ����ʻ���', N'leopard')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1757f12f-a254-e511-8d70-00155d0c740d', N'��ͨ���', N'zhongtong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1857f12f-a254-e511-8d70-00155d0c740d', N'լ����', N'zhaijisong')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1957f12f-a254-e511-8d70-00155d0c740d', N'��������', N'zhongtiewuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1a57f12f-a254-e511-8d70-00155d0c740d', N'��������', N'ztky')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1b57f12f-a254-e511-8d70-00155d0c740d', N'��������', N'zhongyouwuliu')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1c57f12f-a254-e511-8d70-00155d0c740d', N'�й�����(COE)', N'coe')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1d57f12f-a254-e511-8d70-00155d0c740d', N'֥�鿪��', N'zhimakaimen')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1e57f12f-a254-e511-8d70-00155d0c740d', N'�й��������', N'youzhengguonei')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'1f57f12f-a254-e511-8d70-00155d0c740d', N'֣�ݽ���', N'zhengzhoujianhua')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'2057f12f-a254-e511-8d70-00155d0c740d', N'���ٿ��', N'zhongsukuaidi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'2157f12f-a254-e511-8d70-00155d0c740d', N'��������', N'zhongtianwanyun')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'2257f12f-a254-e511-8d70-00155d0c740d', N'����ٵ�', N'zhongruisudi')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'2357f12f-a254-e511-8d70-00155d0c740d', N'�������ٵ�', N'zhongwaiyun')
INSERT [dbo].[p_ExpressCompany] ([CompanyGUID], [CompanyName], [CompanyCode]) VALUES (N'2457f12f-a254-e511-8d70-00155d0c740d', N'�����ٵ�', N'zengyisudi')

END
GO

---------------------------�����ֵ����ɹ���(V2.5)--------------------------------
GO
IF NOT EXISTS(SELECT 1 FROM sysobjects WHERE id=OBJECT_ID('[p_ExpressHistoryInfo]'))
BEGIN
/*==============================================================*/
/* Table: p_ExpressHistoryInfo                                              */
/*==============================================================*/
CREATE TABLE [dbo].[p_ExpressHistoryInfo](
	[ExpressHistoryGUID] uniqueidentifier  NOT NULL  DEFAULT newsequentialid() ,
	[ExpressGUID] uniqueidentifier   ,
	[ExpressNo] nvarchar(100)   ,
	[ExpressCompanyCode] nvarchar(200)   ,
	[Receiver] nvarchar(500)   ,
	[State] tinyint,
	[CreatedOn] datetime   DEFAULT getdate() ,
	PRIMARY KEY(ExpressHistoryGUID)
)
	

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '��ݵ�����ʷ��Ϣ','user', @CurrentUser, 'table', 'p_ExpressHistoryInfo'
execute sp_addextendedproperty 'MS_Description',  '�����ʷ��ϢGUID' ,'user', @CurrentUser, 'table', 'p_ExpressHistoryInfo', 'column', 'ExpressHistoryGUID'
execute sp_addextendedproperty 'MS_Description',  '�����ϢGUID' ,'user', @CurrentUser, 'table', 'p_ExpressHistoryInfo', 'column', 'ExpressGUID'
execute sp_addextendedproperty 'MS_Description',  '��ݵ���' ,'user', @CurrentUser, 'table', 'p_ExpressHistoryInfo', 'column', 'ExpressNo'
execute sp_addextendedproperty 'MS_Description',  '��ݹ�˾���' ,'user', @CurrentUser, 'table', 'p_ExpressHistoryInfo', 'column', 'ExpressCompanyCode'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ������' ,'user', @CurrentUser, 'table', 'p_ExpressHistoryInfo', 'column', 'Receiver'
execute sp_addextendedproperty 'MS_Description',  '��ݵ���ǰ��״̬(
0����;�������ﴦ����������У�
1���������������ɿ�ݹ�˾���ղ��Ҳ����˵�һ��������Ϣ��
2�����ѣ�������͹��̳������⣻
3��ǩ�գ��ռ�����ǩ�գ�
4����ǩ�������������û���ǩ��������ԭ���˻أ����ҷ������Ѿ�ǩ�գ�
5���ɼ�����������ڽ���ͬ���ɼ���
6���˻أ������������˻ط����˵�;��;)' ,'user', @CurrentUser, 'table', 'p_ExpressHistoryInfo', 'column', 'State'
execute sp_addextendedproperty 'MS_Description',  '��������' ,'user', @CurrentUser, 'table', 'p_ExpressHistoryInfo', 'column', 'CreatedOn'

END
GO

---------------------------�����ֵ����ɹ���(V2.5)--------------------------------
GO
IF NOT EXISTS(SELECT 1 FROM sysobjects WHERE id=OBJECT_ID('[p_ExpressInfo]'))
BEGIN
/*==============================================================*/
/* Table: p_ExpressInfo                                              */
/*==============================================================*/
CREATE TABLE [dbo].[p_ExpressInfo](
	[ExpressGUID] uniqueidentifier  NOT NULL  DEFAULT newsequentialid() ,
	[ExpressNo] nvarchar(100)   ,
	[ExpressCompanyCode] nvarchar(200)   ,
	[Receiver] nvarchar(500)   ,
	[CreatedOn] datetime   DEFAULT getdate() ,
	PRIMARY KEY(ExpressGUID)
)
	

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '��ݵ�����Ϣ','user', @CurrentUser, 'table', 'p_ExpressInfo'
execute sp_addextendedproperty 'MS_Description',  '�����ϢGUID' ,'user', @CurrentUser, 'table', 'p_ExpressInfo', 'column', 'ExpressGUID'
execute sp_addextendedproperty 'MS_Description',  '��ݵ���' ,'user', @CurrentUser, 'table', 'p_ExpressInfo', 'column', 'ExpressNo'
execute sp_addextendedproperty 'MS_Description',  '��ݹ�˾���' ,'user', @CurrentUser, 'table', 'p_ExpressInfo', 'column', 'ExpressCompanyCode'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ������' ,'user', @CurrentUser, 'table', 'p_ExpressInfo', 'column', 'Receiver'
execute sp_addextendedproperty 'MS_Description',  '��������' ,'user', @CurrentUser, 'table', 'p_ExpressInfo', 'column', 'CreatedOn'

END
GO

---------------------------�����ֵ����ɹ���(V2.5)--------------------------------
GO
IF NOT EXISTS(SELECT 1 FROM sysobjects WHERE id=OBJECT_ID('[p_ExpressProcessDetail]'))
BEGIN
/*==============================================================*/
/* Table: p_ExpressProcessDetail                                              */
/*==============================================================*/
CREATE TABLE [dbo].[p_ExpressProcessDetail](
	[ExpressProcessDetailGuid] uniqueidentifier  NOT NULL  DEFAULT newsequentialid() ,
	[GroupNo] int,
	[ExpressNo] nvarchar(100)   ,
	[Time] datetime   ,
	[Context] nvarchar(500)   ,
	PRIMARY KEY(ExpressProcessDetailGuid)
)
	

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '��ݵ�������ϸ','user', @CurrentUser, 'table', 'p_ExpressProcessDetail'
execute sp_addextendedproperty 'MS_Description',  '��ݵ�������ϸGUID' ,'user', @CurrentUser, 'table', 'p_ExpressProcessDetail', 'column', 'ExpressProcessDetailGuid'
execute sp_addextendedproperty 'MS_Description',  '������ϸ���ڱ��' ,'user', @CurrentUser, 'table', 'p_ExpressProcessDetail', 'column', 'GroupNo'
execute sp_addextendedproperty 'MS_Description',  '��ݵ���' ,'user', @CurrentUser, 'table', 'p_ExpressProcessDetail', 'column', 'ExpressNo'
execute sp_addextendedproperty 'MS_Description',  '������Ϣ��ʱ��' ,'user', @CurrentUser, 'table', 'p_ExpressProcessDetail', 'column', 'Time'
execute sp_addextendedproperty 'MS_Description',  'ÿ��������Ϣ������' ,'user', @CurrentUser, 'table', 'p_ExpressProcessDetail', 'column', 'Context'

END
GO

---------------------------�����ֵ����ɹ���(V2.5)--------------------------------
GO
IF NOT EXISTS(SELECT 1 FROM sysobjects WHERE id=OBJECT_ID('[p_Message]'))
BEGIN
/*==============================================================*/
/* Table: p_Message                                              */
/*==============================================================*/
CREATE TABLE [dbo].[p_Message](
	[MessageGuid] uniqueidentifier  NOT NULL  DEFAULT newsequentialid() ,
	[Receiver] nvarchar(50)   ,
	[Content] nvarchar(MAX)   ,
	[Subject] nvarchar(200)   ,
	[Type] tinyint   DEFAULT 0 ,
	[CreatedOn] datetime   DEFAULT getdate() ,
	PRIMARY KEY(MessageGuid)
)
	

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '��Ϣ��','user', @CurrentUser, 'table', 'p_Message'
execute sp_addextendedproperty 'MS_Description',  '��ϢGUID' ,'user', @CurrentUser, 'table', 'p_Message', 'column', 'MessageGuid'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ������' ,'user', @CurrentUser, 'table', 'p_Message', 'column', 'Receiver'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ����' ,'user', @CurrentUser, 'table', 'p_Message', 'column', 'Content'
execute sp_addextendedproperty 'MS_Description',  '�ʼ�����' ,'user', @CurrentUser, 'table', 'p_Message', 'column', 'Subject'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ����    0������ 1���ʼ�' ,'user', @CurrentUser, 'table', 'p_Message', 'column', 'Type'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ��������' ,'user', @CurrentUser, 'table', 'p_Message', 'column', 'CreatedOn'

END
GO

---------------------------�����ֵ����ɹ���(V2.5)--------------------------------
GO
IF NOT EXISTS(SELECT 1 FROM sysobjects WHERE id=OBJECT_ID('[p_MessageHistory]'))
BEGIN
/*==============================================================*/
/* Table: p_MessageHistory                                              */
/*==============================================================*/
CREATE TABLE [dbo].[p_MessageHistory](
	[MessageHistoryGuid] uniqueidentifier  NOT NULL  DEFAULT newsequentialid() ,
	[MessageGuid] uniqueidentifier   ,
	[Receiver] nvarchar(50)   ,
	[Type] tinyint   DEFAULT 0 ,
	[Content] nvarchar(MAX)   ,
	[Subject] nvarchar(200)   ,
	[CreatedOn] datetime   ,
	[SendOn] datetime   DEFAULT getdate() ,
	[Staue] tinyint   DEFAULT 0 ,
	[Remark] nvarchar(max),
	PRIMARY KEY(MessageHistoryGuid)
)
	

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '��Ϣ��ʷ��','user', @CurrentUser, 'table', 'p_MessageHistory'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ��ʷGUID' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'MessageHistoryGuid'
execute sp_addextendedproperty 'MS_Description',  '��ϢGUID' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'MessageGuid'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ������' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'Receiver'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ����    0������ 1���ʼ�' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'Type'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ����' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'Content'
execute sp_addextendedproperty 'MS_Description',  '�ʼ�����' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'Subject'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ��������' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'CreatedOn'
execute sp_addextendedproperty 'MS_Description',  '��Ϣ��������' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'SendOn'

execute sp_addextendedproperty 'MS_Description',  '��Ϣ����״̬(
 0:���ͳɹ�
 1:����ʧ��
)' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'Staue'
execute sp_addextendedproperty 'MS_Description',  '��ע' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'Remark'

END
GO

GO
IF NOT EXISTS(SELECT 1 FROM syscolumns WHERE id=OBJECT_ID('[p_ExpressProcessDetail]') AND name='State')
BEGIN
	ALTER TABLE [dbo].[p_ExpressProcessDetail] ADD State TINYINT   	
	declare @CurrentUser sysname
	select @CurrentUser = user_name()
	execute sp_addextendedproperty 'MS_Description',  '��ݵ���ǰ��״̬(
	0����;�������ﴦ����������У�
	1���������������ɿ�ݹ�˾���ղ��Ҳ����˵�һ��������Ϣ��
	2�����ѣ�������͹��̳������⣻
	3��ǩ�գ��ռ�����ǩ�գ�
	4����ǩ�������������û���ǩ��������ԭ���˻أ����ҷ������Ѿ�ǩ�գ�
	5���ɼ�����������ڽ���ͬ���ɼ���
	6���˻أ������������˻ط����˵�;��;)' ,'user', @CurrentUser, 'table', 'p_ExpressProcessDetail', 'column', 'State'
END
GO

GO
IF NOT EXISTS(SELECT 1 FROM syscolumns WHERE id=OBJECT_ID('[p_Message]') AND name='FromType')
BEGIN
	ALTER TABLE [dbo].[p_Message] ADD FromType NVARCHAR(200)   	
	declare @CurrentUser sysname
	select @CurrentUser = user_name()
	execute sp_addextendedproperty 'MS_Description',  '��Ϣ��Դ(eg:��ݽ���)' ,'user', @CurrentUser, 'table', 'p_Message', 'column', 'FromType'
END
GO

GO
IF NOT EXISTS(SELECT 1 FROM syscolumns WHERE id=OBJECT_ID('[p_Message]') AND name='FkGUID')
BEGIN
	ALTER TABLE [dbo].[p_Message] ADD FkGUID uniqueidentifier   	
	declare @CurrentUser sysname
	select @CurrentUser = user_name()
	execute sp_addextendedproperty 'MS_Description',  '��Ϣ��ԴGUID' ,'user', @CurrentUser, 'table', 'p_Message', 'column', 'FkGUID'
END
GO

GO
IF NOT EXISTS(SELECT 1 FROM syscolumns WHERE id=OBJECT_ID('[p_MessageHistory]') AND name='FromType')
BEGIN
	ALTER TABLE [dbo].[p_MessageHistory] ADD FromType NVARCHAR(200)   	
	declare @CurrentUser sysname
	select @CurrentUser = user_name()
	execute sp_addextendedproperty 'MS_Description',  '��Ϣ��Դ(eg:��ݽ���)' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'FromType'
END
GO

GO
IF NOT EXISTS(SELECT 1 FROM syscolumns WHERE id=OBJECT_ID('[p_MessageHistory]') AND name='FkGUID')
BEGIN
	ALTER TABLE [dbo].[p_MessageHistory] ADD FkGUID uniqueidentifier   	
	declare @CurrentUser sysname
	select @CurrentUser = user_name()
	execute sp_addextendedproperty 'MS_Description',  '��Ϣ��ԴGUID' ,'user', @CurrentUser, 'table', 'p_MessageHistory', 'column', 'FkGUID'
END
GO

---------------------------�����ֵ����ɹ���(V2.5)--------------------------------
GO
IF NOT EXISTS(SELECT 1 FROM sysobjects WHERE id=OBJECT_ID('[p_Task]'))
BEGIN
/*==============================================================*/
/* Table: p_Task                                              */
/*==============================================================*/
CREATE TABLE [dbo].[p_Task](
	[TaskID] uniqueidentifier   DEFAULT newsequentialid() ,
	[TaskName] nvarchar(300)   ,
	[TaskParam] nvarchar(max)   ,
	[CronExpressionString] nvarchar(200)   ,
	[Assembly] nvarchar(150)   ,
	[Class] nvarchar(150)   ,
	[Status] int   DEFAULT 0 ,
	[CreatedOn] datetime   DEFAULT getdate() ,
	[ModifyOn] datetime   ,
	[RecentRunTime] datetime   ,
	[LastRunTime] datetime   ,
	[CronRemark] nvarchar(300)   ,
	[Remark] nvarchar(1000)   ,
	PRIMARY KEY(TaskID)
)
	

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '�����','user', @CurrentUser, 'table', 'p_Task'
execute sp_addextendedproperty 'MS_Description',  '����ID' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'TaskID'
execute sp_addextendedproperty 'MS_Description',  '��������' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'TaskName'
execute sp_addextendedproperty 'MS_Description',  '�������' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'TaskParam'
execute sp_addextendedproperty 'MS_Description',  '��������Cron���ʽ' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'CronExpressionString'
execute sp_addextendedproperty 'MS_Description',  '��������' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'Assembly'
execute sp_addextendedproperty 'MS_Description',  '������������������ռ�' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'Class'
execute sp_addextendedproperty 'MS_Description',  '��������״̬    0:���� 1:ֹͣ' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'Status'
execute sp_addextendedproperty 'MS_Description',  '����ʱ��' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'CreatedOn'
execute sp_addextendedproperty 'MS_Description',  '�޸�ʱ��' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'ModifyOn'
execute sp_addextendedproperty 'MS_Description',  '�������ʱ��' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'RecentRunTime'
execute sp_addextendedproperty 'MS_Description',  '�´�����ʱ��' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'LastRunTime'
execute sp_addextendedproperty 'MS_Description',  '���ʽ����˵��' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'CronRemark'
execute sp_addextendedproperty 'MS_Description',  '��ע' ,'user', @CurrentUser, 'table', 'p_Task', 'column', 'Remark'

END
GO

DELETE FROM p_Task WHERE TaskID IN('5ebaa648-d1e8-e511-b79d-54ee75868db8','5fbaa648-d1e8-e511-b79d-54ee75868db8','60baa648-d1e8-e511-b79d-54ee75868db8','61baa648-d1e8-e511-b79d-54ee75868db8')
INSERT INTO dbo.p_Task
        ( 
		  TaskID ,
          TaskName ,
          TaskParam ,
          CronExpressionString ,
          Assembly ,
          Class ,
		  Status,
          CronRemark 
        )
SELECT '5ebaa648-d1e8-e511-b79d-54ee75868db8' AS TaskID,'����-��ȡ����IP' AS TaskName,'{"IPUrl":"http://www.xicidaili.com/nn","DefaultProxyIp":"",IsPingIp:false}' AS TaskParam,
'0 0 */1 * * ?' AS CronExpressionString,'Ywdsoft.Task' AS ASSEMBLY,'Ywdsoft.Task.TaskSet.IpProxyJob' AS Class,0 as Status,'ÿ1��Сʱ����һ��' AS CronRemark
UNION ALL
SELECT '5fbaa648-d1e8-e511-b79d-54ee75868db8','��������,�����ǰʱ��','','0/10 * * * * ?' ,'Ywdsoft.Task','Ywdsoft.Task.TaskSet.TestJob',0,'ÿ10������һ��'
UNION ALL
SELECT '60baa648-d1e8-e511-b79d-54ee75868db8','��ݽ�����Ϣ','222.45.58.64:8118','0 0 */1 * * ?' ,'Ywdsoft.Task','Ywdsoft.Task.TaskSet.ExpressProgressJob',0,'ÿ1��Сʱ����һ��'
UNION ALL
SELECT '61baa648-d1e8-e511-b79d-54ee75868db8','������Ϣ����','','0 0/3 6-23 * * ?' ,'Ywdsoft.Task','Ywdsoft.Task.TaskSet.SendMessageJob',0,'ÿ��6:00-23:00ÿ3��������һ��'

GO
