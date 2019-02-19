CREATE OR REPLACE FUNCTION
numProductsAtEvent(eventId integer)
RETURNS integer AS
$$
DECLARE
queryString TEXT;
numProduct INTEGER;
BEGIN
numPeaks = 0;
-- build the query
queryString = 'SELECT COUNT( * ) FROM peak ' ||
COALESCE (' WHERE Region=' ||
QUOTE_LITERAL(whichRegion) ,'');
-- run the query
EXECUTE queryString INTO numPeaks;
RETURN numPeaks;
END;
$$
LANGUAGE plpgsql;