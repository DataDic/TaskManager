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

