#if !defined(_G711_H_)
#define _G711_H_

#ifdef __cplusplus
extern "C" {
#endif


/** �� G711a ���ݽ���Ϊ���� PCM ����
*  @param[in]     pInG711uData		G711u ����
*  @param[in]     nInG711uLen		G711u ���ݳ���
*  @param[out]    pOutPcmData		������ PCM ����
*  @param[in out] pOutPcmDataLen    ������ PCM ���ݳ���
*  @return ���ؽ��
*		false					ʧ��
*		true				    �ɹ�
*/
bool ADecode(unsigned char * pInG711aData, int nInG711aLen, unsigned char * pOutPcmData,int &pOutPcmDataLen);



/** �� G711u ���ݽ���Ϊ���� PCM ����
*  @param[in]     pInG711uData		G711u ����
*  @param[in]     nInG711uLen		G711u ���ݳ���
*  @param[out]    pOutPcmData		������ PCM ����
*  @param[in out] pOutPcmDataLen    ������ PCM ���ݳ���
*  @return ���ؽ��
*		false					ʧ��
*		true				    �ɹ�
*/
bool  UDecode(unsigned char * pInG711uData, int nInG711uLen, unsigned char * pOutPcmData,int &pOutPcmDataLen);


/** �� ����PCM ���ݱ���Ϊ G711U ����
*  @param[in]     pInPcmData		PCM ����
*  @param[in]     nInPcmLen		    PCM ���ݳ���
*  @param[out]    pG711uData		������ G711U ����
*  @param[in out] pG711uDataLen     ������ G711U ���ݳ���
*  @return ���ؽ��
*		false					ʧ��
*		true				    �ɹ�
*/
bool  UEncode(unsigned char *pInPcmData, int nInPcmLen, unsigned char *pG711uData,int &pG711uDataLen);


/** �� ����PCM ���ݱ���Ϊ G711a ����
*  @param[in]     pInPcmData		PCM ����
*  @param[in]     nInPcmLen		    PCM ���ݳ���
*  @param[out]    pG711aData		������ G711a ����
*  @param[in out] pG711aDataLen     ������ G711a ���ݳ���
*  @return ���ؽ��
*		false					ʧ��
*		true				    �ɹ�
*/
bool  AEncode(unsigned char *pInPcmData, int nInPcmLen, unsigned char * pG711aData,int &pG711aDataLen);

bool  AlawToUlaw(unsigned char * pG711aData,int &pG711aDataLen);

bool  UlawToAlaw( unsigned char * pG711aData,int &pG711aDataLen);



#ifdef __cplusplus
}
#endif

#endif
