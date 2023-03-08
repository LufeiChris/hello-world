#if !defined(_G711_H_)
#define _G711_H_

#ifdef __cplusplus
extern "C" {
#endif


/** 对 G711a 数据解码为线性 PCM 数据
*  @param[in]     pInG711uData		G711u 数据
*  @param[in]     nInG711uLen		G711u 数据长度
*  @param[out]    pOutPcmData		解码后的 PCM 数据
*  @param[in out] pOutPcmDataLen    解码后的 PCM 数据长度
*  @return 返回结果
*		false					失败
*		true				    成功
*/
bool ADecode(unsigned char * pInG711aData, int nInG711aLen, unsigned char * pOutPcmData,int &pOutPcmDataLen);



/** 对 G711u 数据解码为线性 PCM 数据
*  @param[in]     pInG711uData		G711u 数据
*  @param[in]     nInG711uLen		G711u 数据长度
*  @param[out]    pOutPcmData		解码后的 PCM 数据
*  @param[in out] pOutPcmDataLen    解码后的 PCM 数据长度
*  @return 返回结果
*		false					失败
*		true				    成功
*/
bool  UDecode(unsigned char * pInG711uData, int nInG711uLen, unsigned char * pOutPcmData,int &pOutPcmDataLen);


/** 对 线性PCM 数据编码为 G711U 数据
*  @param[in]     pInPcmData		PCM 数据
*  @param[in]     nInPcmLen		    PCM 数据长度
*  @param[out]    pG711uData		编码后的 G711U 数据
*  @param[in out] pG711uDataLen     编码后的 G711U 数据长度
*  @return 返回结果
*		false					失败
*		true				    成功
*/
bool  UEncode(unsigned char *pInPcmData, int nInPcmLen, unsigned char *pG711uData,int &pG711uDataLen);


/** 对 线性PCM 数据编码为 G711a 数据
*  @param[in]     pInPcmData		PCM 数据
*  @param[in]     nInPcmLen		    PCM 数据长度
*  @param[out]    pG711aData		编码后的 G711a 数据
*  @param[in out] pG711aDataLen     编码后的 G711a 数据长度
*  @return 返回结果
*		false					失败
*		true				    成功
*/
bool  AEncode(unsigned char *pInPcmData, int nInPcmLen, unsigned char * pG711aData,int &pG711aDataLen);

bool  AlawToUlaw(unsigned char * pG711aData,int &pG711aDataLen);

bool  UlawToAlaw( unsigned char * pG711aData,int &pG711aDataLen);



#ifdef __cplusplus
}
#endif

#endif
