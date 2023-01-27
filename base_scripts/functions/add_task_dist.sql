--Функция которая добовляет задачу по дистанции в список 
--CREATE DATE 2023.01.25

CREATE OR REPLACE FUNCTION add_task_distance(
    city_id integer,
    house_id integer,
    lat1 numeric,
    lon1 numeric
)

RETURNS void 
AS
$BODY$

DECLARE 
    
    value record;
    foot_dist integer;
    car_dist integer;
    query varchar(500);

BEGIN
    
    FOR value IN 
        SELECT 
            latitude AS lat
            ,longitude AS lon
            ,f_objects_type AS objects_type
            ,object_id
            ,name_obj
        FROM ps_object_position 
        WHERE 1=1
            AND f_city = city_id 
            AND calculation_position(lat1, lon1, latitude, longitude) < 3000
    LOOP
        
        query = format('CALL load_end_dist(''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'')',
                city_id, house_id, value.object_id, value.objects_type, lat1, lon1, value.lat, value.lon); 
                
        INSERT INTO ts_dist_task (f_status, query)
        VALUES (1, query);
        
        RAISE NOTICE 'Запись успешно добавлена по дому № % и объекту № %', house_id, value.object_id;

    END LOOP;

END;
$BODY$
LANGUAGE plpgsql
