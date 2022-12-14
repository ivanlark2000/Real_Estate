CREATE trigger Add_Buff_Value
BEFORE INSERT ON BF_Temp_Apartments_Ads FOR EACH ROW
EXECUTE PROCEDURE Add_Buff_Value();

CREATE trigger LG_Session_Log_add_date
BEFORE INSERT ON LG_Session_LOG FOR EACH ROW
EXECUTE PROCEDURE Add_Date();

CREATE TRIGGER cor_street_trigger
BEFORE INSERT ON BF_Temp_Apartments_Ads FOR EACH ROW
EXECUTE PROCEDURE cor_street_tr();

CREATE trigger MN_Official_Builder_add_date
BEFORE INSERT ON MN_Official_Builder FOR EACH ROW
EXECUTE PROCEDURE Add_Create_Date();

CREATE trigger MN_House_add_date
BEFORE INSERT ON MN_House FOR EACH ROW
EXECUTE PROCEDURE Add_Create_Date();


CREATE trigger MN_Period_Deadline_add_date
BEFORE INSERT ON MN_Period_Deadline FOR EACH ROW
EXECUTE PROCEDURE Add_Create_Date();

CREATE trigger INF_Descriptions_add_date
BEFORE INSERT ON INF_Descriptions FOR EACH ROW
EXECUTE PROCEDURE Add_Create_Date();

CREATE trigger ES_Technics_add_date
BEFORE INSERT ON ES_Technics FOR EACH ROW
EXECUTE PROCEDURE Add_Create_Date();

CREATE trigger ES_Furniture_add_date
BEFORE INSERT ON ES_Furniture FOR EACH ROW
EXECUTE PROCEDURE Add_Create_Date();