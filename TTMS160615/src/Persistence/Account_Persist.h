﻿/*
 * Account_Persist.h
 *
 *  Created on: 2015年5月12日
 *      Author: Administrator
 */

#ifndef ACCOUNTPERSIST_H_
#define ACCOUNTPERSIST_H_

#include "../Service/Account.h"

int Account_Perst_CheckAccFile();

//根据用户名载入账号
int Account_Perst_SelByName(char usrName[], account_t *buf);

int Account_Perst_Verify(char usrName[], char pwd[]);
int Account_Perst_Insert(const account_t *data);
int Account_Perst_Update(const account_t *data);
int Account_Perst_DeleteByID(int id);
int Account_Perst_SelectByID(int id, account_t *buf);
int Account_Perst_SelectAll(account_list_t list);

#endif /* ACCOUNTPERSIST_H_ */


