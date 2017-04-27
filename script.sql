delimiter //

/* ppl 1 START */

DROP TABLE IF EXISTS ppl1 //
DROP VIEW IF EXISTS ppl1 //
CREATE VIEW ppl1 AS SELECT * FROM ppl //

DROP TABLE IF EXISTS ppl1_l //
DROP VIEW IF EXISTS ppl1_l //
CREATE VIEW ppl1_l AS SELECT * FROM ppl_l //

/* ppl1 END */

/* ppl START */
DROP TRIGGER IF EXISTS ppl_beupd //
CREATE TRIGGER ppl_beupd BEFORE UPDATE ON `ppl` FOR EACH ROW
BEGIN

	DECLARE dummy INT;
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF ( OLD.PersonStatusID = 1 AND NEW.PersonStatusID = 2 ) THEN
			SET NEW.OrganizationManager	= 0;	
			SET NEW.BusinesscardDecisionmaker = 0;
			SET NEW.BusinesscardHandler	= 0;
			SET NEW.HotelreservationDecisionmaker = 0; 
			SET NEW.HotelreservationHandler	= 0;
			SET NEW.TrainticketDecisionmaker = 0; 
			SET NEW.TrainticketHandler = 0; 
			SET NEW.VacationDecisionmaker = 0; 
			SET NEW.VacationHandler = 0; 
			SET NEW.RepairorderDecisionmaker  = 0;
			SET NEW.RepairorderHandler = 0; 
			SET NEW.HelpdeskDecisionmaker  = 0;
			SET NEW.HelpdeskHandler = 0; 
			SET NEW.InternalorderDecisionmaker = 0; 
			SET NEW.InternalorderHandler = 0; 
			SET NEW.AdvanceDecisionmaker = 0; 
			SET NEW.AdvanceApprover = 0;
			SET NEW.AdvanceHandler = 0; 
			SET NEW.CollateralDecisionmaker = 0; 
			SET NEW.CollateralHandler = 0; 
			SET NEW.InvoiceDecisionmaker = 0;
			SET NEW.InvoiceApprover = 0;		
			SET NEW.InvoiceHandler = 0; 
			SET NEW.IncominginvoiceRegistrar = 0;
			SET NEW.IncominginvoiceDecisionmaker = 0;
			SET NEW.IncominginvoiceApprover = 0;		
			SET NEW.IncominginvoiceHandler = 0; 
			SET NEW.BusinesstripDecisionmaker = 0; 
			SET NEW.BusinesstripHandler = 0; 
			SET NEW.TripexpensesDecisionmaker = 0; 
			SET NEW.TripexpensesApprover = 0;
			SET NEW.TripexpensesHandler = 0;
			SET NEW.FlightbookingDecisionmaker = 0;
			SET NEW.FlightbookingHandler = 0;		
			SET NEW.ProjectManager = 0;
			SET NEW.TaskManager = 0;
			SET NEW.ConferenceroomHandler = 0;
			SET NEW.ConferenceresourceHandler = 0;
			SET NEW.ConferenceordersHandler = 0;
			SET NEW.TimesheetHandler = 0;
			SET NEW.TimesheetDecisionmaker = 0;
			SET NEW.SystemHandler = 0;
			SET NEW.LibraryHandler = 0;
			SET NEW.IDCardHandler = 0;
			SET NEW.ParkingHandler = 0;
			SET NEW.KeyHandler = 0;
			SET NEW.LocationHandler = 0;
			SET NEW.OrganizationHandler = 0;
			SET NEW.PersonHandler = 0;
			SET NEW.FleetHandler = 0;
			SET NEW.ExpenseDecisionmaker = 0; 
			SET NEW.ExpenseApprover = 0;
			SET NEW.ExpenseHandler = 0;
			SET NEW.EquipmentHandler = 0;			
		END IF;
	
		SET NEW.RolesSum = 
		  NEW.OrganizationManager		
		+ NEW.BusinesscardDecisionmaker
		+ NEW.BusinesscardHandler
		+ NEW.HotelreservationDecisionmaker 
		+ NEW.HotelreservationHandler 
		+ NEW.TrainticketDecisionmaker 
		+ NEW.TrainticketHandler 
		+ NEW.VacationDecisionmaker 
		+ NEW.VacationHandler 
		+ NEW.RepairorderDecisionmaker 
		+ NEW.RepairorderHandler 
		+ NEW.HelpdeskDecisionmaker 
		+ NEW.HelpdeskHandler 
		+ NEW.InternalorderDecisionmaker 
		+ NEW.InternalorderHandler 
		+ NEW.AdvanceDecisionmaker 
		+ NEW.AdvanceApprover
		+ NEW.AdvanceHandler 
		+ NEW.CollateralDecisionmaker 
		+ NEW.CollateralHandler 
		+ NEW.InvoiceDecisionmaker
		+ NEW.InvoiceApprover		
		+ NEW.InvoiceHandler 
		+ NEW.IncominginvoiceRegistrar
		+ NEW.IncominginvoiceDecisionmaker
		+ NEW.IncominginvoiceApprover		
		+ NEW.IncominginvoiceHandler 
		+ NEW.BusinesstripDecisionmaker 
		+ NEW.BusinesstripHandler 
		+ NEW.TripexpensesDecisionmaker 
		+ NEW.TripexpensesApprover
		+ NEW.TripexpensesHandler
		+ NEW.FlightbookingDecisionmaker
		+ NEW.FlightbookingHandler		
		+ NEW.ProjectManager
		+ NEW.TaskManager
		+ NEW.ConferenceroomHandler
		+ NEW.ConferenceresourceHandler
		+ NEW.ConferenceordersHandler
		+ NEW.TimesheetHandler
		+ NEW.TimesheetDecisionmaker
		+ NEW.SystemHandler
		+ NEW.LibraryHandler
		+ NEW.IDCardHandler
		+ NEW.ParkingHandler
		+ NEW.KeyHandler
		+ NEW.LocationHandler
		+ NEW.OrganizationHandler
		+ NEW.PersonHandler
		+ NEW.FleetHandler
		+ NEW.ExpenseDecisionmaker 
		+ NEW.ExpenseApprover
		+ NEW.ExpenseHandler
		+ NEW.EquipmentHandler		
		+0; 		
		
		IF ( NEW.RolesSum > 0 AND OLD.PersonStatusID = 2 AND NEW.PersonStatusID = 2 ) THEN 
			-- "You have no permissions to make this action for this case!"
			SELECT `error_3028` into dummy FROM `ntf` LIMIT 1;
		END IF;
		
		IF NEW.RolesSum = 0 THEN
			SET NEW.RolesSum = NULL;
		END IF;
		
	END IF;
END;//

DROP TRIGGER IF EXISTS ppl_afupd //
CREATE TRIGGER ppl_afupd AFTER UPDATE ON `ppl` FOR EACH ROW
BEGIN
	DECLARE groupID INT;
	DECLARE memberID INT;
	DECLARE recordDeleted INT;
	DECLARE personID INT;
	DECLARE poweruserID INT;
	
	SET personID = NEW.PersonID;
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
	-- Is manager in the organization
	
		CALL group_membership_mgm( 
		 OLD.OrganizationManager, NEW.OrganizationManager, 'mng', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
	-- Advance payments	
		
		-- AdvanceDecisionmaker		
		CALL group_membership_mgm( 
		 OLD.AdvanceDecisionmaker, NEW.AdvanceDecisionmaker, 'ap', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- AdvanceApprover
		CALL group_membership_mgm( 
		 OLD.AdvanceApprover, NEW.AdvanceApprover, 'ap', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- AdvanceHandler
		CALL group_membership_mgm( 
		 OLD.AdvanceHandler, NEW.AdvanceHandler, 'ap', NEW.PersonID, NEW._ModBy, NEW._ModDate );		 
		CALL mfn_membership_mgm( 
		 OLD.AdvanceHandler, NEW.AdvanceHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		CALL poweruser_mgm( 
		 OLD.AdvanceHandler, NEW.AdvanceHandler, 'xap', NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		CALL poweruser_mgm( 
		 OLD.AdvanceHandler, NEW.AdvanceHandler, 'xapr', NEW.PersonID, NEW._ModBy, NEW._ModDate );			
	
	-- Expenses in spe approval	
		
		-- ExpenseDecisionmaker		
		CALL group_membership_mgm( 
		 OLD.ExpenseDecisionmaker, NEW.ExpenseDecisionmaker, 'es', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- ExpenseApprover
		CALL group_membership_mgm( 
		 OLD.ExpenseApprover, NEW.ExpenseApprover, 'es', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- ExpenseHandler
		CALL group_membership_mgm( 
		 OLD.ExpenseHandler, NEW.ExpenseHandler, 'es', NEW.PersonID, NEW._ModBy, NEW._ModDate );		 
		CALL mfn_membership_mgm( 
		 OLD.ExpenseHandler, NEW.ExpenseHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		CALL poweruser_mgm( 
		 OLD.ExpenseHandler, NEW.ExpenseHandler, 'xes', NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		CALL poweruser_mgm( 
		 OLD.ExpenseHandler, NEW.ExpenseHandler, 'xesr', NEW.PersonID, NEW._ModBy, NEW._ModDate );

	
	-- Business trip reimbursable expenses	
	
		-- TripexpensesDecisionmaker
		CALL group_membership_mgm( 
		 OLD.TripexpensesDecisionmaker, NEW.TripexpensesDecisionmaker, 'bte', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- TripexpensesApprover
		CALL group_membership_mgm( 
		 OLD.TripexpensesApprover, NEW.TripexpensesApprover, 'bte', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- TripexpensesHandler
		CALL group_membership_mgm( 
		 OLD.TripexpensesHandler, NEW.TripexpensesHandler, 'bte', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL group_membership_mgm( 
		 OLD.TripexpensesHandler, NEW.TripexpensesHandler, 'bteav', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.TripexpensesHandler, NEW.TripexpensesHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		CALL poweruser_mgm( 
		 OLD.TripexpensesHandler, NEW.TripexpensesHandler, 'xbte', NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		CALL poweruser_mgm( 
		 OLD.TripexpensesHandler, NEW.TripexpensesHandler, 'xbter', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.TripexpensesHandler, NEW.TripexpensesHandler, 'xbtea', NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		CALL poweruser_mgm( 
		 OLD.TripexpensesHandler, NEW.TripexpensesHandler, 'xbtev', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Invoice assignment
	
	    -- InvoiceDecisionmaker
		CALL group_membership_mgm( 
		 OLD.InvoiceDecisionmaker, NEW.InvoiceDecisionmaker, 'i', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- InvoiceApprover
		CALL group_membership_mgm( 
		 OLD.InvoiceApprover, NEW.InvoiceApprover, 'i', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- InvoiceHandler
		CALL group_membership_mgm( 
		 OLD.InvoiceHandler, NEW.InvoiceHandler, 'i', NEW.PersonID, NEW._ModBy, NEW._ModDate );		 
		CALL mfn_membership_mgm( 
		 OLD.InvoiceHandler, NEW.InvoiceHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		CALL poweruser_mgm( 
		 OLD.InvoiceHandler, NEW.InvoiceHandler, 'xi', NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		CALL poweruser_mgm( 
		 OLD.InvoiceHandler, NEW.InvoiceHandler, 'xir', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Incoming invoice assignment
	
		-- IncominginvoiceRegistrar
		CALL group_membership_mgm( 
		 OLD.IncominginvoiceRegistrar, NEW.IncominginvoiceRegistrar, 'iir', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.IncominginvoiceRegistrar, NEW.IncominginvoiceRegistrar, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.InvoiceHandler, NEW.InvoiceHandler, 'xiir', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.InvoiceHandler, NEW.InvoiceHandler, 'xiirn', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		-- IncominginvoiceDecisionmaker
		CALL group_membership_mgm( 
		 OLD.IncominginvoiceDecisionmaker, NEW.IncominginvoiceDecisionmaker, 'ii', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- IncominginvoiceApprover
		CALL group_membership_mgm( 
		 OLD.IncominginvoiceApprover, NEW.IncominginvoiceApprover, 'ii', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- IncominginvoiceHandler
		CALL group_membership_mgm( 
		 OLD.IncominginvoiceHandler, NEW.IncominginvoiceHandler, 'ii', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.IncominginvoiceHandler, NEW.IncominginvoiceHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.IncominginvoiceHandler, NEW.IncominginvoiceHandler, 'xii', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.IncominginvoiceHandler, NEW.IncominginvoiceHandler, 'xiirr', NEW.PersonID, NEW._ModBy, NEW._ModDate );

	-- Help desk
	
		-- HelpdeskDecisionmaker
		CALL group_membership_mgm( 
		 OLD.HelpdeskDecisionmaker, NEW.HelpdeskDecisionmaker, 'hd', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- HelpdeskHandler
		CALL group_membership_mgm( 
		 OLD.HelpdeskHandler, NEW.HelpdeskHandler, 'hd', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.HelpdeskHandler, NEW.HelpdeskHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.HelpdeskHandler, NEW.HelpdeskHandler, 'xhd', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.HelpdeskHandler, NEW.HelpdeskHandler, 'xhdr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
	-- Item repair orders
	
		-- RepairorderDecisionmaker
		CALL group_membership_mgm( 
		 OLD.RepairorderDecisionmaker, NEW.RepairorderDecisionmaker, 'ro', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- RepairorderHandler
		CALL group_membership_mgm( 
		 OLD.RepairorderHandler, NEW.RepairorderHandler, 'ro', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.RepairorderHandler, NEW.RepairorderHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.RepairorderHandler, NEW.RepairorderHandler, 'xro', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.RepairorderHandler, NEW.RepairorderHandler, 'xror', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Hotel reservations
	
		-- HotelreservationDecisionmaker
		CALL group_membership_mgm( 
		 OLD.HotelreservationDecisionmaker, NEW.HotelreservationDecisionmaker, 'hr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- HotelreservationHandler
		CALL group_membership_mgm( 
		 OLD.HotelreservationHandler, NEW.HotelreservationHandler, 'hr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.HotelreservationHandler, NEW.HotelreservationHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.HotelreservationHandler, NEW.HotelreservationHandler, 'xhr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.HotelreservationHandler, NEW.HotelreservationHandler, 'xhrr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
	-- Train tickets
	
		-- TrainticketDecisionmaker
		CALL group_membership_mgm( 
		 OLD.TrainticketDecisionmaker, NEW.TrainticketDecisionmaker, 'tt', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- TrainticketHandler
		CALL group_membership_mgm( 
		 OLD.TrainticketHandler, NEW.TrainticketHandler, 'tt', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.TrainticketHandler, NEW.TrainticketHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.TrainticketHandler, NEW.TrainticketHandler, 'xtt', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.TrainticketHandler, NEW.TrainticketHandler, 'xttr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Airline tickets booking
	
		-- FlightbookingDecisionmaker
		CALL group_membership_mgm( 
		 OLD.FlightbookingDecisionmaker, NEW.FlightbookingDecisionmaker, 'at', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- FlightbookingHandler
		CALL group_membership_mgm( 
		 OLD.FlightbookingHandler, NEW.FlightbookingHandler, 'at', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.FlightbookingHandler, NEW.FlightbookingHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.FlightbookingHandler, NEW.FlightbookingHandler, 'xat', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.FlightbookingHandler, NEW.FlightbookingHandler, 'xatr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
	-- Business cards
	
		-- BusinesscardDecisionmaker
		CALL group_membership_mgm( 
		 OLD.BusinesscardDecisionmaker, NEW.BusinesscardDecisionmaker, 'bc', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- BusinesscardHandler
		CALL group_membership_mgm( 
		 OLD.BusinesscardHandler, NEW.BusinesscardHandler, 'bc', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.BusinesscardHandler, NEW.BusinesscardHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.BusinesscardHandler, NEW.BusinesscardHandler, 'xbc', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.BusinesscardHandler, NEW.BusinesscardHandler, 'xbcr', NEW.PersonID, NEW._ModBy, NEW._ModDate );		
	
	-- Vacation requests
	
		-- VacationDecisionmaker
		CALL group_membership_mgm( 
		 OLD.VacationDecisionmaker, NEW.VacationDecisionmaker, 'v', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- VacationHandler
		CALL group_membership_mgm( 
		 OLD.VacationHandler, NEW.VacationHandler, 'v', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.VacationHandler, NEW.VacationHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.VacationHandler, NEW.VacationHandler, 'xv', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.VacationHandler, NEW.VacationHandler, 'xvr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
	-- Business trips approval
		
		-- BusinesstripDecisionmaker
		CALL group_membership_mgm( 
		 OLD.BusinesstripDecisionmaker, NEW.BusinesstripDecisionmaker, 'bto', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- BusinesstripHandler
		CALL group_membership_mgm( 
		 OLD.BusinesstripHandler, NEW.BusinesstripHandler, 'bto', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.BusinesstripHandler, NEW.BusinesstripHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.BusinesstripHandler, NEW.BusinesstripHandler, 'xbto', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.BusinesstripHandler, NEW.BusinesstripHandler, 'xbtor', NEW.PersonID, NEW._ModBy, NEW._ModDate );	
		 
	-- Internal orders
	
		-- InternalorderDecisionmaker
		CALL group_membership_mgm( 
		 OLD.InternalorderDecisionmaker, NEW.InternalorderDecisionmaker, 'io', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- InternalorderHandler
		CALL group_membership_mgm( 
		 OLD.InternalorderHandler, NEW.InternalorderHandler, 'io', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.InternalorderHandler, NEW.InternalorderHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.InternalorderHandler, NEW.InternalorderHandler, 'xio', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.InternalorderHandler, NEW.InternalorderHandler, 'xior', NEW.PersonID, NEW._ModBy, NEW._ModDate );	
	
	-- Work timesheet
		-- TimesheetDecisionmaker
		CALL group_membership_mgm( 
		 OLD.TimesheetDecisionmaker, NEW.TimesheetDecisionmaker, 'ts', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
		-- TimesheetHandler
		CALL group_membership_mgm( 
		 OLD.TimesheetHandler, NEW.TimesheetHandler, 'ts', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.TimesheetHandler, NEW.TimesheetHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.TimesheetHandler, NEW.TimesheetHandler, 'xts', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.TimesheetHandler, NEW.TimesheetHandler, 'xtsr', NEW.PersonID, NEW._ModBy, NEW._ModDate );	
		CALL poweruser_mgm( 
		 OLD.TimesheetHandler, NEW.TimesheetHandler, 'xtsrr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Marketing collateral ordering
	
		-- CollateralDecisionmaker
		CALL group_membership_mgm( 
		 OLD.CollateralDecisionmaker, NEW.CollateralDecisionmaker, 'mo', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
		-- CollateralHandler
		CALL group_membership_mgm( 
		 OLD.CollateralHandler, NEW.CollateralHandler, 'mo', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL group_membership_mgm( 
		 OLD.CollateralHandler, NEW.CollateralHandler, 'mc', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.CollateralHandler, NEW.CollateralHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.CollateralHandler, NEW.CollateralHandler, 'xmo', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.CollateralHandler, NEW.CollateralHandler, 'xmor', NEW.PersonID, NEW._ModBy, NEW._ModDate );	
		CALL poweruser_mgm( 
		 OLD.CollateralHandler, NEW.CollateralHandler, 'xmc', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.CollateralHandler, NEW.CollateralHandler, 'xmcs', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.CollateralHandler, NEW.CollateralHandler, 'xim', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Conference resources calendar
	
		-- ConferenceresourceHandler
		CALL group_membership_mgm( 
		 OLD.ConferenceresourceHandler, NEW.ConferenceresourceHandler, 'mr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.ConferenceresourceHandler, NEW.ConferenceresourceHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.ConferenceresourceHandler, NEW.ConferenceresourceHandler, 'xmr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.ConferenceresourceHandler, NEW.ConferenceresourceHandler, 'xmrc', NEW.PersonID, NEW._ModBy, NEW._ModDate );	
	
	-- Conference rooms calendar
	
		-- ConferenceroomHandler
		CALL group_membership_mgm( 
		 OLD.ConferenceroomHandler, NEW.ConferenceroomHandler, 'r', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.ConferenceroomHandler, NEW.ConferenceroomHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.ConferenceroomHandler, NEW.ConferenceroomHandler, 'xr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.ConferenceroomHandler, NEW.ConferenceroomHandler, 'xrc', NEW.PersonID, NEW._ModBy, NEW._ModDate );	
		
		-- ConferenceordersHandler
		CALL mfn_membership_mgm( 
		 OLD.ConferenceordersHandler, NEW.ConferenceordersHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.ConferenceordersHandler, NEW.ConferenceordersHandler, 'xrcc', NEW.PersonID, NEW._ModBy, NEW._ModDate );	
	
	-- People
	
		-- PersonHandler
		CALL group_membership_mgm( 
		 OLD.PersonHandler, NEW.PersonHandler, 'ppl', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.PersonHandler, NEW.PersonHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.PersonHandler, NEW.PersonHandler, 'ppl', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.PersonHandler, NEW.PersonHandler, 'ppls', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
	-- Organizations
	
		-- OrganizationHandler
		CALL group_membership_mgm( 
		 OLD.OrganizationHandler, NEW.OrganizationHandler, 'org', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.OrganizationHandler, NEW.OrganizationHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.OrganizationHandler, NEW.OrganizationHandler, 'org', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Locations
	
		-- LocationHandler
		CALL group_membership_mgm( 
		 OLD.LocationHandler, NEW.LocationHandler, 'locb', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.LocationHandler, NEW.LocationHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.LocationHandler, NEW.LocationHandler, 'locb', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.LocationHandler, NEW.LocationHandler, 'loc', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
	-- Keys
		-- KeyHandler
		CALL group_membership_mgm( 
		 OLD.KeyHandler, NEW.KeyHandler, 'kp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.KeyHandler, NEW.KeyHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.KeyHandler, NEW.KeyHandler, 'xk', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.KeyHandler, NEW.KeyHandler, 'xkp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Library
	
		-- LibraryHandler
		CALL group_membership_mgm( 
		 OLD.LibraryHandler, NEW.LibraryHandler, 'bp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.LibraryHandler, NEW.LibraryHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.LibraryHandler, NEW.LibraryHandler, 'xb', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.LibraryHandler, NEW.LibraryHandler, 'xbp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
	-- Parking places
	
		-- ParkingHandler
		CALL group_membership_mgm( 
		 OLD.ParkingHandler, NEW.ParkingHandler, 'pp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.ParkingHandler, NEW.ParkingHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.ParkingHandler, NEW.ParkingHandler, 'xpp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- ID cards
		-- IDCardHandler
		CALL group_membership_mgm( 
		 OLD.IDCardHandler, NEW.IDCardHandler, 'ic', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.IDCardHandler, NEW.IDCardHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.IDCardHandler, NEW.IDCardHandler, 'xic', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Projects
	
		-- ProjectManager
		CALL group_membership_mgm( 
		 OLD.ProjectManager, NEW.ProjectManager, 'ptj', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.ProjectManager, NEW.ProjectManager, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.ProjectManager, NEW.ProjectManager, 'xp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.ProjectManager, NEW.ProjectManager, 'xt', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.ProjectManager, NEW.ProjectManager, 'xj', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
		-- TaskManager
		CALL group_membership_mgm( 
		 OLD.TaskManager, NEW.TaskManager, 'ptj', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.TaskManager, NEW.TaskManager, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.TaskManager, NEW.TaskManager, 'xp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.TaskManager, NEW.TaskManager, 'xt', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.TaskManager, NEW.TaskManager, 'xj', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
	-- Fleet management
	
		-- FleetHandler
		CALL group_membership_mgm( 
		 OLD.FleetHandler, NEW.FleetHandler, 'cp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.FleetHandler, NEW.FleetHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.FleetHandler, NEW.FleetHandler, 'xc', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.FleetHandler, NEW.FleetHandler, 'xcp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- Equipment management
	
		-- EquipmentHandler
		CALL group_membership_mgm( 
		 OLD.EquipmentHandler, NEW.EquipmentHandler, 'ep', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL mfn_membership_mgm( 
		 OLD.EquipmentHandler, NEW.EquipmentHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.EquipmentHandler, NEW.EquipmentHandler, 'xe', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.EquipmentHandler, NEW.EquipmentHandler, 'xep', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	
	--  === SystemHandler ===
		CALL mfn_membership_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, NEW.RolesSum, NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
		-- Absent days from work register		
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xad', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
		-- Meetings scheduling
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xa', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xar', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
		-- Attendance lists
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xal', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xalr', NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		 
		-- Kitty lists
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xkl', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xklr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		 
		-- Events booking
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xet', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xetr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- microSpreadsheets
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xs', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xsr', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
		-- Event calendar
		CALL poweruser_mgm( 
		 OLD.SystemHandler, NEW.SystemHandler, 'xec', NEW.PersonID, NEW._ModBy, NEW._ModDate );
		
	END IF;
END;//

/* ppl END */

/* usr  START */
DROP TRIGGER IF EXISTS usr_afins //
CREATE TRIGGER usr_afins AFTER INSERT ON `usr` FOR EACH ROW
BEGIN
    
	CALL group_membership_mgm( 0, 1, 'emp', NEW.PersonID, NEW._ModBy, NEW._ModDate );
	
	-- dashboard charts on start 
	INSERT `dsbc` SET 
		UserID = NEW.PersonID, 
		ModuleID = 'ppl', 
		ChartName = 'Pie01', 
		SortOrder = 1, 
		_ModBy = NEW._ModBy, 
		_ModDate = NEW._ModDate,
		_Deleted = 0;	
		
	INSERT `dsbc` SET 
		UserID = NEW.PersonID, 
		ModuleID = 'ppl', 
		ChartName = 'Pareto03', 
		SortOrder = 2, 
		_ModBy = NEW._ModBy, 
		_ModDate = NEW._ModDate,
		_Deleted = 0;
		
	INSERT `dsbc` SET 
		UserID = NEW.PersonID, 
		ModuleID = 'ppl', 
		ChartName = 'Pie02', 
		SortOrder = 3, 
		_ModBy = NEW._ModBy, 
		_ModDate = NEW._ModDate,
		_Deleted = 0;
		
END;//

DROP TRIGGER IF EXISTS usr_afupd //
CREATE TRIGGER usr_afupd AFTER UPDATE ON `usr` FOR EACH ROW
BEGIN

	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		CALL group_membership_mgm( 0, 1, 'emp', NEW.PersonID, NEW._ModBy, NEW._ModDate );		
		
	END IF;
	
	IF ( OLD._Deleted = 1 AND NEW._Deleted = 0 ) THEN
	
		-- dashboard charts on start 
		INSERT `dsbc` SET 
			UserID = NEW.PersonID, 
			ModuleID = 'ppl', 
			ChartName = 'Pie01', 
			SortOrder = 1, 
			_ModBy = NEW._ModBy, 
			_ModDate = NEW._ModDate,
			_Deleted = 0;	
			
		INSERT `dsbc` SET 
			UserID = NEW.PersonID, 
			ModuleID = 'ppl', 
			ChartName = 'Pareto03', 
			SortOrder = 2, 
			_ModBy = NEW._ModBy, 
			_ModDate = NEW._ModDate,
			_Deleted = 0;
			
		INSERT `dsbc` SET 
			UserID = NEW.PersonID, 
			ModuleID = 'ppl', 
			ChartName = 'Pie02', 
			SortOrder = 3, 
			_ModBy = NEW._ModBy, 
			_ModDate = NEW._ModDate,
			_Deleted = 0;
		
	END IF;
	
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
	
			UPDATE `usrgm` SET usrgm._Deleted = 1 WHERE
			usrgm.PersonID = NEW.PersonID;
	
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = 'usr' AND rmd.RelatedRecordID = NEW.PersonID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = 'usr' AND att.RelatedRecordID = NEW.PersonID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = 'usr' AND nts.RelatedRecordID = NEW.PersonID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = 'usr' AND cos.RelatedRecordID = NEW.PersonID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = 'usr' AND lnk.RelatedRecordID = NEW.PersonID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = 'usr' AND ntf.RelatedRecordID = NEW.PersonID;

			-- dashboard charts
			UPDATE `dsbc` SET dsbc._Deleted = 1 WHERE 
			dsbc.UserID = NEW.PersonID;	
	END IF;
	
END;//
/* usr END */

/* xv  START */
DROP TRIGGER IF EXISTS xv_beupd //
CREATE TRIGGER xv_beupd BEFORE UPDATE ON `xv` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  VacationHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE VacationHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  _SupervisorID swaped or implementation as isHandler
	SELECT NEW._ModBy = NEW._SupervisorID	
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
		 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	-- swap  _VacationID for PKF field !
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
	
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xv_afupd //
CREATE TRIGGER xv_afupd AFTER UPDATE ON `xv` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _VacationID for PKF field !	
	SELECT NEW._VacationID 	
	 INTO theRecordID;
	SELECT 'xv' 	
	 INTO theModuleID;
	SELECT 'VacationDecisionmaker' 	
	 INTO Decisionmakers;
	SELECT NEW._SupervisorID
	 INTO Decisionmaker; 
	SELECT 'VacationHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
		
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				-- SET Receivers = Decisionmakers;
				SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			 
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xvr` SET
				
				 xvr._ReplacementID = NEW._ReplacementID,
				 xvr._VacationTypeID = NEW._VacationTypeID,
				 xvr._VacationBegin = NEW._VacationBegin,
				 xvr._VacationFinish = NEW._VacationFinish,
				 xvr._WorkingdaysCount = NEW._WorkingdaysCount,
				 xvr._VacationRemarks = NEW._VacationRemarks,
				 
				 xvr._VacationPersonID = NEW._OwnedBy,				 
				 xvr._SubmittedOn = NEW._SubmittedOn,
				 xvr._SubmittedRemark = NEW._SubmittedRemark,
				 xvr._AcceptedByID = OLD._ModBy,
				 xvr._AcceptedOn = OLD._ModDate,
				 xvr._AcceptedRemark = OLD._ProcessStepRemark,
				 xvr._ClosedOn = thecreationTime,
				 xvr._ClosedByID = NEW._ModBy,
				 xvr._ClosedRemark = NEW._ProcessStepRemark,
				 xvr._ModBy = NEW._ModBy,
				 xvr._ModDate = thecreationTime,
				 xvr._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO registerRecordID;
			
			INSERT `xvr_l` SET
				
				 xvr_l._VacationID = registerRecordID,
				 
				 xvr_l._ReplacementID = NEW._ReplacementID,
				 xvr_l._VacationTypeID = NEW._VacationTypeID,
				 xvr_l._VacationBegin = NEW._VacationBegin,
				 xvr_l._VacationFinish = NEW._VacationFinish,
				 xvr_l._WorkingdaysCount = NEW._WorkingdaysCount,
				 xvr_l._VacationRemarks = NEW._VacationRemarks,
				 
				 xvr_l._VacationPersonID = NEW._OwnedBy,			
				 xvr_l._SubmittedOn = NEW._SubmittedOn,
				 xvr_l._SubmittedRemark = NEW._SubmittedRemark,
				 xvr_l._AcceptedByID = OLD._ModBy,
				 xvr_l._AcceptedOn = OLD._ModDate,
				 xvr_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xvr_l._ClosedOn = thecreationTime,
				 xvr_l._ClosedByID = NEW._ModBy,
				 xvr_l._ClosedRemark = NEW._ProcessStepRemark,
				 xvr_l._ModBy = NEW._ModBy,
				 xvr_l._ModDate = thecreationTime,
				 xvr_l._Deleted = 0;
						
			END IF;
		END IF;		
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xv  END */

/* xtt START */
DROP TRIGGER IF EXISTS xtt_beupd //
CREATE TRIGGER xtt_beupd BEFORE UPDATE ON `xtt` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  TrainticketHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE TrainticketHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE TrainticketDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
		 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;	
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xtt_afupd //
CREATE TRIGGER xtt_afupd AFTER UPDATE ON `xtt` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _VacationID for PKF field !	
	SELECT NEW._TrainticketID 	
	 INTO theRecordID;
	SELECT 'xtt' 	
	 INTO theModuleID;
	SELECT 'TrainticketDecisionmaker' 	
	 INTO Decisionmakers;
	-- SELECT NEW._SupervisorID
	--  INTO Decisionmaker; 
	SELECT 'TrainticketHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
			
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				SET Receivers = Decisionmakers;
				-- SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xttr` SET
				
				 xttr._TrainDepartureStation = NEW._TrainDepartureStation,
				 xttr._TrainArrivalStation = NEW._TrainArrivalStation,
				 xttr._TrainDepartureDate = NEW._TrainDepartureDate,
				 xttr._TrainDepartureTime = NEW._TrainDepartureTime,			 
				 xttr._TrainTickedTypeID = NEW._TrainTickedTypeID,
				 xttr._TrainTickedTypeDescription = NEW._TrainTickedTypeDescription,
				 xttr._TrainType = NEW._TrainType,
				 xttr._TrainticketClassID = NEW._TrainticketClassID,
				 xttr._TrainReservationTicket = NEW._TrainReservationTicket,
				 xttr._TrainWagoonTypeID = NEW._TrainWagoonTypeID,
				 xttr._TrainticketCount = NEW._TrainticketCount,
				 xttr._TrainticketRemarks = NEW._TrainticketRemarks,
				 
				 xttr._OwnedBy = NEW._OwnedBy,
				 xttr._SubmittedOn = NEW._SubmittedOn,
				 xttr._SubmittedRemark = NEW._SubmittedRemark,			 
				 xttr._AcceptedByID = OLD._ModBy,
				 xttr._AcceptedOn = OLD._ModDate,
				 xttr._AcceptedRemark = OLD._ProcessStepRemark,
				 xttr._ClosedOn = thecreationTime,
				 xttr._ClosedByID = NEW._ModBy,
				 xttr._ClosedRemark = NEW._ProcessStepRemark,
				 xttr._ModBy = NEW._ModBy,
				 xttr._ModDate = thecreationTime,
				 xttr._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xttr_l` SET
				
				 xttr_l._TrainticketID = registerRecordID,
				 
				 xttr_l._TrainDepartureStation = NEW._TrainDepartureStation,
				 xttr_l._TrainArrivalStation = NEW._TrainArrivalStation,
				 xttr_l._TrainDepartureDate = NEW._TrainDepartureDate,
				 xttr_l._TrainDepartureTime = NEW._TrainDepartureTime,
				 xttr_l._TrainTickedTypeID = NEW._TrainTickedTypeID,
				 xttr_l._TrainTickedTypeDescription = NEW._TrainTickedTypeDescription,
				 xttr_l._TrainType = NEW._TrainType,
				 xttr_l._TrainticketClassID = NEW._TrainticketClassID,
				 xttr_l._TrainReservationTicket = NEW._TrainReservationTicket,
				 xttr_l._TrainWagoonTypeID = NEW._TrainWagoonTypeID,
				 xttr_l._TrainticketCount = NEW._TrainticketCount,
				 xttr_l._TrainticketRemarks = NEW._TrainticketRemarks,
				 
				 xttr_l._OwnedBy = NEW._OwnedBy,
				 xttr_l._SubmittedOn = NEW._SubmittedOn,
				 xttr_l._SubmittedRemark = NEW._SubmittedRemark,		
				 xttr_l._AcceptedByID = OLD._ModBy,
				 xttr_l._AcceptedOn = OLD._ModDate,
				 xttr_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xttr_l._ClosedOn = thecreationTime,
				 xttr_l._ClosedByID = NEW._ModBy,
				 xttr_l._ClosedRemark = NEW._ProcessStepRemark,
				 xttr_l._ModBy = NEW._ModBy,
				 xttr_l._ModDate = thecreationTime,
				 xttr_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xtt END */

/* xhr START */
DROP TRIGGER IF EXISTS xhr_beupd //
CREATE TRIGGER xhr_beupd BEFORE UPDATE ON `xhr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  HotelreservationHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE HotelreservationHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE HotelreservationDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF; 	
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xhr_afupd //
CREATE TRIGGER xhr_afupd AFTER UPDATE ON `xhr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _VacationID for PKF field !
	SELECT NEW._HotelreservationID 	
	 INTO theRecordID;
	SELECT 'xhr' 	
	 INTO theModuleID;
	SELECT 'HotelreservationDecisionmaker' 	
	 INTO Decisionmakers;
	-- SELECT NEW._SupervisorID
	--  INTO Decisionmaker; 
	SELECT 'HotelreservationHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
			
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				SET Receivers = Decisionmakers;
				-- SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xhrr` SET
				
				 xhrr._HotelCountryID = NEW._HotelCountryID,
				 xhrr._HotelPlace = NEW._HotelPlace,
				 xhrr._HotelArrival = NEW._HotelArrival,
				 xhrr._HotelDeparture = NEW._HotelDeparture,			 
				 xhrr._HotelBreakfest = NEW._HotelBreakfest,
				 xhrr._HotelParking = NEW._HotelParking,
				 xhrr._HotelRoomtypeID = NEW._HotelRoomtypeID,
				 xhrr._HotelRoomCount = NEW._HotelRoomCount,
				 xhrr._HotelRemarks = NEW._HotelRemarks,
				 
				 xhrr._OwnedBy = NEW._OwnedBy,
				 xhrr._SubmittedOn = NEW._SubmittedOn,
				 xhrr._SubmittedRemark = NEW._SubmittedRemark,				 
				 xhrr._AcceptedByID = OLD._ModBy,
				 xhrr._AcceptedOn = OLD._ModDate,
				 xhrr._AcceptedRemark = OLD._ProcessStepRemark,
				 xhrr._ClosedOn = thecreationTime,
				 xhrr._ClosedByID = NEW._ModBy,
				 xhrr._ClosedRemark = NEW._ProcessStepRemark,
				 xhrr._ModBy = NEW._ModBy,
				 xhrr._ModDate = thecreationTime,
				 xhrr._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xhrr_l` SET
				
				 xhrr_l._HotelreservationID = registerRecordID,
				 
				 xhrr_l._HotelCountryID = NEW._HotelCountryID,
				 xhrr_l._HotelPlace = NEW._HotelPlace,
				 xhrr_l._HotelArrival = NEW._HotelArrival,
				 xhrr_l._HotelDeparture = NEW._HotelDeparture,			 
				 xhrr_l._HotelBreakfest = NEW._HotelBreakfest,
				 xhrr_l._HotelParking = NEW._HotelParking,
				 xhrr_l._HotelRoomtypeID = NEW._HotelRoomtypeID,
				 xhrr_l._HotelRoomCount = NEW._HotelRoomCount,
				 xhrr_l._HotelRemarks = NEW._HotelRemarks,
				 
				 xhrr_l._OwnedBy = NEW._OwnedBy,
				 xhrr_l._SubmittedOn = NEW._SubmittedOn,
				 xhrr_l._SubmittedRemark = NEW._SubmittedRemark,				 
				 xhrr_l._AcceptedByID = OLD._ModBy,
				 xhrr_l._AcceptedOn = OLD._ModDate,
				 xhrr_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xhrr_l._ClosedOn = thecreationTime,
				 xhrr_l._ClosedByID = NEW._ModBy,
				 xhrr_l._ClosedRemark = NEW._ProcessStepRemark,
				 xhrr_l._ModBy = NEW._ModBy,
				 xhrr_l._ModDate = thecreationTime,
				 xhrr_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xhr END */

/* xbc START */
DROP TRIGGER IF EXISTS xbc_beupd //
CREATE TRIGGER xbc_beupd BEFORE UPDATE ON `xbc` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  HotelreservationHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE BusinesscardHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE BusinesscardDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;					
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;	
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xbc_afupd //
CREATE TRIGGER xbc_afupd AFTER UPDATE ON `xbc` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _BusinesscardID for PKF field !
	SELECT NEW._BusinesscardID 	
	 INTO theRecordID;
	SELECT 'xbc' 	
	 INTO theModuleID;
	SELECT 'BusinesscardDecisionmaker' 	
	 INTO Decisionmakers;
	-- SELECT NEW._SupervisorID
	--  INTO Decisionmaker; 
	SELECT 'BusinesscardHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
		
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				SET Receivers = Decisionmakers;
				-- SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xbcr` SET
				
				 xbcr._BusinesscardTitle = NEW._BusinesscardTitle,
				 xbcr._BusinesscardFirstName = NEW._BusinesscardFirstName,
				 xbcr._BusinesscardFamilyName = NEW._BusinesscardFamilyName,
				 xbcr._BusinesscardPosition = NEW._BusinesscardPosition,
				 xbcr._BusinesscardAddress = NEW._BusinesscardAddress,
				 xbcr._BusinesscardPhone = NEW._BusinesscardPhone,
				 xbcr._BusinesscardFax = NEW._BusinesscardFax,
				 xbcr._BusinesscardMobile = NEW._BusinesscardMobile,
				 xbcr._BusinesscardEmail = NEW._BusinesscardEmail,
				 xbcr._BusinesscardHomepage = NEW._BusinesscardHomepage,
				 xbcr._BusinesscardCount = NEW._BusinesscardCount,
				 xbcr._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xbcr._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 
				 xbcr._OwnedBy = NEW._OwnedBy,
				 xbcr._SubmittedOn = NEW._SubmittedOn,
				 xbcr._SubmittedRemark = NEW._SubmittedRemark,				 
				 xbcr._AcceptedByID = OLD._ModBy,
				 xbcr._AcceptedOn = OLD._ModDate,
				 xbcr._AcceptedRemark = OLD._ProcessStepRemark,
				 xbcr._ClosedOn = thecreationTime,
				 xbcr._ClosedByID = NEW._ModBy,
				 xbcr._ClosedRemark = NEW._ProcessStepRemark,
				 xbcr._ModBy = NEW._ModBy,
				 xbcr._ModDate = thecreationTime,
				 xbcr._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xbcr_l` SET
				
				 xbcr_l._BusinesscardID = registerRecordID,
				 
				 xbcr_l._BusinesscardTitle = NEW._BusinesscardTitle,
				 xbcr_l._BusinesscardFirstName = NEW._BusinesscardFirstName,
				 xbcr_l._BusinesscardFamilyName = NEW._BusinesscardFamilyName,
				 xbcr_l._BusinesscardPosition = NEW._BusinesscardPosition,
				 xbcr_l._BusinesscardAddress = NEW._BusinesscardAddress,
				 xbcr_l._BusinesscardPhone = NEW._BusinesscardPhone,
				 xbcr_l._BusinesscardFax = NEW._BusinesscardFax,
				 xbcr_l._BusinesscardMobile = NEW._BusinesscardMobile,
				 xbcr_l._BusinesscardEmail = NEW._BusinesscardEmail,
				 xbcr_l._BusinesscardHomepage = NEW._BusinesscardHomepage,
				 xbcr_l._BusinesscardCount = NEW._BusinesscardCount,
				 xbcr_l._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xbcr_l._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 
				 xbcr_l._OwnedBy = NEW._OwnedBy,
				 xbcr_l._SubmittedOn = NEW._SubmittedOn,
				 xbcr_l._SubmittedRemark = NEW._SubmittedRemark,				 
				 xbcr_l._AcceptedByID = OLD._ModBy,
				 xbcr_l._AcceptedOn = OLD._ModDate,
				 xbcr_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xbcr_l._ClosedOn = thecreationTime,
				 xbcr_l._ClosedByID = NEW._ModBy,
				 xbcr_l._ClosedRemark = NEW._ProcessStepRemark,
				 xbcr_l._ModBy = NEW._ModBy,
				 xbcr_l._ModDate = thecreationTime,
				 xbcr_l._Deleted = 0;
			END IF;
		END IF;
	END IF;	
	
		-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
	
END;//
 
/* xbc END */

/* xro START */
DROP TRIGGER IF EXISTS xro_beupd //
CREATE TRIGGER xro_beupd BEFORE UPDATE ON `xro` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  XxxHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE RepairorderHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE RepairorderDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
	
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();					
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xro_afupd //
CREATE TRIGGER xro_afupd AFTER UPDATE ON `xro` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _RepairorderID for PKF field !
	SELECT NEW._RepairorderID 	
	 INTO theRecordID;
	SELECT 'xro' 	
	 INTO theModuleID;
	SELECT 'RepairorderDecisionmaker' 	
	 INTO Decisionmakers;
	-- SELECT NEW._SupervisorID
	--  INTO Decisionmaker; 
	SELECT 'RepairorderHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
			
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				SET Receivers = Decisionmakers;
				-- SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xror` SET
				 
				 xror._RepairorderLocationID = NEW._RepairorderLocationID,
				 xror._RepairorderBuildingID = NEW._RepairorderBuildingID,
				 xror._RepairorderPlace = NEW._RepairorderPlace,
				 xror._RepairorderName = NEW._RepairorderName,
				 xror._RepairorderDescription = NEW._RepairorderDescription,
				 
				 xror._OwnedBy = NEW._OwnedBy,
				 xror._SubmittedOn = NEW._SubmittedOn,
				 xror._SubmittedRemark = NEW._SubmittedRemark,				 
				 xror._AcceptedByID = OLD._ModBy,
				 xror._AcceptedOn = OLD._ModDate,
				 xror._AcceptedRemark = OLD._ProcessStepRemark,
				 xror._ClosedOn = thecreationTime,
				 xror._ClosedByID = NEW._ModBy,
				 xror._ClosedRemark = NEW._ProcessStepRemark,
				 xror._ModBy = NEW._ModBy,
				 xror._ModDate = thecreationTime,
				 xror._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xror_l` SET
				
				 xror_l._RepairorderID = registerRecordID,
				 
				 xror_l._RepairorderLocationID = NEW._RepairorderLocationID,
				 xror_l._RepairorderBuildingID = NEW._RepairorderBuildingID,
				 xror_l._RepairorderPlace = NEW._RepairorderPlace,
				 xror_l._RepairorderName = NEW._RepairorderName,
				 xror_l._RepairorderDescription = NEW._RepairorderDescription,
				 
				 xror_l._OwnedBy = NEW._OwnedBy,
				 xror_l._SubmittedOn = NEW._SubmittedOn,
				 xror_l._SubmittedRemark = NEW._SubmittedRemark,				 
				 xror_l._AcceptedByID = OLD._ModBy,
				 xror_l._AcceptedOn = OLD._ModDate,
				 xror_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xror_l._ClosedOn = thecreationTime,
				 xror_l._ClosedByID = NEW._ModBy,
				 xror_l._ClosedRemark = NEW._ProcessStepRemark,
				 xror_l._ModBy = NEW._ModBy,
				 xror_l._ModDate = thecreationTime,
				 xror_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xro END */

/* xhd START */
DROP TRIGGER IF EXISTS xhd_beupd //
CREATE TRIGGER xhd_beupd BEFORE UPDATE ON `xhd` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  HotelreservationHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE HelpdeskHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE HelpdeskDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
		
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF; 
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xhd_afupd //
CREATE TRIGGER xhd_afupd AFTER UPDATE ON `xhd` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _HelpticketIDfor PKF field !
	SELECT NEW._HelpticketID 	
	 INTO theRecordID;
	SELECT 'xhd' 	
	 INTO theModuleID;
	SELECT 'HelpdeskDecisionmaker' 	
	 INTO Decisionmakers;
	-- SELECT NEW._SupervisorID
	--  INTO Decisionmaker; 
	SELECT 'HelpdeskHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
		
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				SET Receivers = Decisionmakers;
				-- SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xhdr` SET
				
				 xhdr._HelpticketSubject = NEW._HelpticketSubject,
				 xhdr._HelpticketDescription = NEW._HelpticketDescription,
				 
				 xhdr._OwnedBy = NEW._OwnedBy,	
				 xhdr._SubmittedOn = NEW._SubmittedOn,
				 xhdr._SubmittedRemark = NEW._SubmittedRemark,
				 xhdr._AcceptedByID = OLD._ModBy,
				 xhdr._AcceptedOn = OLD._ModDate,
				 xhdr._AcceptedRemark = OLD._ProcessStepRemark,
				 xhdr._ClosedOn = thecreationTime,
				 xhdr._ClosedByID = NEW._ModBy,
				 xhdr._ClosedRemark = NEW._ProcessStepRemark,
				 xhdr._ModBy = NEW._ModBy,
				 xhdr._ModDate = thecreationTime,
				 xhdr._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xhdr_l` SET
				
				 xhdr_l._HelpticketID = registerRecordID,
				 
				 xhdr_l._HelpticketSubject = NEW._HelpticketSubject,
				 xhdr_l._HelpticketDescription = NEW._HelpticketDescription,
				 
				 xhdr_l._OwnedBy = NEW._OwnedBy,
				 xhdr_l._SubmittedOn = NEW._SubmittedOn,
				 xhdr_l._SubmittedRemark = NEW._SubmittedRemark,				 
				 xhdr_l._AcceptedByID = OLD._ModBy,
				 xhdr_l._AcceptedOn = OLD._ModDate,
				 xhdr_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xhdr_l._ClosedOn = thecreationTime,
				 xhdr_l._ClosedByID = NEW._ModBy,
				 xhdr_l._ClosedRemark = NEW._ProcessStepRemark,
				 xhdr_l._ModBy = NEW._ModBy,
				 xhdr_l._ModDate = thecreationTime,
				 xhdr_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xhd END */

/* xio START */
DROP TRIGGER IF EXISTS xio_beupd //
CREATE TRIGGER xio_beupd BEFORE UPDATE ON `xio` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  _InternalorderHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE InternalorderHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE InternalorderDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF; 
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xio_afupd //
CREATE TRIGGER xio_afupd AFTER UPDATE ON `xio` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _HelpticketIDfor PKF field !
	SELECT NEW._InternalorderID 	
	 INTO theRecordID;
	SELECT 'xio' 	
	 INTO theModuleID;
	-- SELECT 'InternalorderDecisionmaker' 	
	-- INTO Decisionmakers;
	SELECT NEW._SupervisorID
	 INTO Decisionmaker; 
	SELECT 'InternalorderHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
			
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				-- SET Receivers = Decisionmakers;
				SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xior` SET
				
				 xior._InternalorderItem = NEW._InternalorderItem,
				 xior._InternalorderUnit = NEW._InternalorderUnit,
				 xior._InternalorderItemCount = NEW._InternalorderItemCount,
				 xior._InternalorderItemPrice = NEW._InternalorderItemPrice,
				 xior._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xior._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 
				 xior._OwnedBy = NEW._OwnedBy,
				 xior._SubmittedOn = NEW._SubmittedOn,
				 xior._SubmittedRemark = NEW._SubmittedRemark,				 
				 xior._AcceptedByID = OLD._ModBy,
				 xior._AcceptedOn = OLD._ModDate,
				 xior._AcceptedRemark = OLD._ProcessStepRemark,
				 xior._ClosedOn = thecreationTime,
				 xior._ClosedByID = NEW._ModBy,
				 xior._ClosedRemark = NEW._ProcessStepRemark,
				 xior._ModBy = NEW._ModBy,
				 xior._ModDate = thecreationTime,
				 xior._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xior_l` SET
				
				 xior_l._InternalorderID = registerRecordID,
				 
				 xior_l._InternalorderItem = NEW._InternalorderItem,
				 xior_l._InternalorderUnit = NEW._InternalorderUnit,
				 xior_l._InternalorderItemCount = NEW._InternalorderItemCount,
				 xior_l._InternalorderItemPrice = NEW._InternalorderItemPrice,
				 xior_l._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xior_l._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 
				 xior_l._OwnedBy = NEW._OwnedBy,
				 xior_l._SubmittedOn = NEW._SubmittedOn,
				 xior_l._SubmittedRemark = NEW._SubmittedRemark,
				 xior_l._AcceptedByID = OLD._ModBy,
				 xior_l._AcceptedOn = OLD._ModDate,
				 xior_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xior_l._ClosedOn = thecreationTime,
				 xior_l._ClosedByID = NEW._ModBy,
				 xior_l._ClosedRemark = NEW._ProcessStepRemark,
				 xior_l._ModBy = NEW._ModBy,
				 xior_l._ModDate = thecreationTime,
				 xior_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xio END */

/* xap START */
DROP TRIGGER IF EXISTS xap_beupd //
CREATE TRIGGER xap_beupd BEFORE UPDATE ON `xap` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  HotelreservationHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE AdvanceApprover = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE AdvanceDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF; 
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xap_afupd //
CREATE TRIGGER xap_afupd AFTER UPDATE ON `xap` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _HelpticketIDfor PKF field !
	SELECT NEW._AdvanceID 	
	 INTO theRecordID;
	SELECT 'xap' 	
	 INTO theModuleID;
	-- SELECT 'HelpdeskDecisionmaker' 	
	-- INTO Decisionmakers;
	SELECT NEW._SupervisorID
	 INTO Decisionmaker; 
	SELECT 'AdvanceApprover' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
		
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				-- SET Receivers = Decisionmakers;
				SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xapr` SET
				
				 xapr._AdvanceSubject = NEW._AdvanceSubject,
				 xapr._AdvanceDescription = NEW._AdvanceDescription,
				 xapr._AdvanceTotal = NEW._AdvanceTotal,
				 
				 xapr._OwnedBy = NEW._OwnedBy,
				 xapr._SubmittedOn = NEW._SubmittedOn,
				 xapr._SubmittedRemark = NEW._SubmittedRemark,				 
				 xapr._AcceptedByID = OLD._ModBy,
				 xapr._AcceptedOn = OLD._ModDate,
				 xapr._AcceptedRemark = OLD._ProcessStepRemark,
				 xapr._ClosedOn = thecreationTime,
				 xapr._ClosedByID = NEW._ModBy,
				 xapr._ClosedRemark = NEW._ProcessStepRemark,
				 xapr._ModBy = NEW._ModBy,
				 xapr._ModDate = thecreationTime,
				 xapr._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xapr_l` SET
				
				 xapr_l._AdvanceID = registerRecordID,
				 
				 xapr_l._AdvanceSubject = NEW._AdvanceSubject,
				 xapr_l._AdvanceDescription = NEW._AdvanceDescription,
				 xapr_l._AdvanceTotal = NEW._AdvanceTotal,
				 
				 xapr_l._OwnedBy = NEW._OwnedBy,
				 xapr_l._SubmittedOn = NEW._SubmittedOn,
				 xapr_l._SubmittedRemark = NEW._SubmittedRemark,
				 xapr_l._AcceptedByID = OLD._ModBy,
				 xapr_l._AcceptedOn = OLD._ModDate,
				 xapr_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xapr_l._ClosedOn = thecreationTime,
				 xapr_l._ClosedByID = NEW._ModBy,
				 xapr_l._ClosedRemark = NEW._ProcessStepRemark,
				 xapr_l._ModBy = NEW._ModBy,
				 xapr_l._ModDate = thecreationTime,
				 xapr_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xap END */

/* xapr START */
DROP TRIGGER IF EXISTS xapr_afins //
CREATE TRIGGER xapr_afins AFTER INSERT ON `xapr` FOR EACH ROW
BEGIN
    
	CALL assign_register_handler( 
	 NEW._AdvanceID, 'xapr', 'AdvanceHandler' , NEW._AdvanceSubject, NEW._ModBy );
	
END;//
/* xapr END */

/* xar START */
DROP TRIGGER IF EXISTS xar_beupd //
CREATE TRIGGER xar_beupd BEFORE UPDATE ON `xar` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	-- Custom
	SELECT xa._ScheduleStatusID  FROM `xa` WHERE xa._ScheduleID = NEW._ScheduleID AND xa._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3010` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//


DROP TRIGGER  IF EXISTS xar_beins //
CREATE TRIGGER xar_beins BEFORE INSERT ON `xar` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	-- Custom
	SELECT xa._ScheduleStatusID  FROM `xa` WHERE xa._ScheduleID = NEW._ScheduleID AND xa._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3010` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//
/* xar END */

/* xsr START */
DROP TRIGGER IF EXISTS xsr_beupd //
CREATE TRIGGER xsr_beupd BEFORE UPDATE ON `xsr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	-- Custom
	SELECT xs._SpreadsheetStatusID  FROM `xs` WHERE xs._SpreadsheetID = NEW._SpreadsheetID AND xs._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3011` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//


DROP TRIGGER  IF EXISTS xsr_beins //
CREATE TRIGGER xsr_beins BEFORE INSERT ON `xsr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	-- Custom
	SELECT xs._SpreadsheetStatusID  FROM `xs` WHERE xs._SpreadsheetID = NEW._SpreadsheetID AND xs._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3011` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//
/* xsrEND */

/* xetr START */
DROP TRIGGER IF EXISTS xetr_beupd //
CREATE TRIGGER xetr_beupd BEFORE UPDATE ON `xetr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	--  Custom
	SELECT xet._EventStatusID  FROM `xet` WHERE xet._EventID = NEW._EventID AND xet._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3012` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//


DROP TRIGGER  IF EXISTS xetr_beins //
CREATE TRIGGER xetr_beins BEFORE INSERT ON `xetr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	-- Custom
	SELECT xet._EventStatusID  FROM `xet` WHERE xet._EventID = NEW._EventID AND xet._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3013` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//
/* xetr  END */

/* xalr  START */
DROP TRIGGER IF EXISTS xalr_beupd //
CREATE TRIGGER xalr_beupd BEFORE UPDATE ON `xalr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	--  Custom
	SELECT xal._AttendanceStatusID  FROM `xal` WHERE xal._AttendanceID = NEW._AttendanceID AND xal._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3013` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//


DROP TRIGGER  IF EXISTS xalr_beins //
CREATE TRIGGER xalr_beins BEFORE INSERT ON `xalr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	--  Custom
	SELECT xal._AttendanceStatusID  FROM `xal` WHERE xal._AttendanceID = NEW._AttendanceID AND xal._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3013` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//
/* xalr  END */

/* xmo START */
DROP TRIGGER IF EXISTS xmo_beupd //
CREATE TRIGGER xmo_beupd BEFORE UPDATE ON `xmo` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  TrainticketHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE CollateralHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE CollateralDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
		 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;					
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;	
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xmo_afupd //
CREATE TRIGGER xmo_afupd AFTER UPDATE ON `xmo` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _VacationID for PKF field !	
	SELECT NEW._CollateralorderingID 	
	 INTO theRecordID;
	SELECT 'xmo' 	
	 INTO theModuleID;
	SELECT 'CollateralDecisionmaker' 	
	 INTO Decisionmakers;
	-- SELECT NEW._SupervisorID
	--  INTO Decisionmaker; 
	SELECT 'CollateralHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
			
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				SET Receivers = Decisionmakers;
				-- SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xmor` SET
				
				 xmor._CollateralID = NEW._CollateralID,
				 xmor._CollateralCustomers = NEW._CollateralCustomers,
				 xmor._CollateralorderingQuantity = NEW._CollateralorderingQuantity,
				 
				 xmor._OwnedBy = NEW._OwnedBy,
				 xmor._SubmittedOn = NEW._SubmittedOn,
				 xmor._SubmittedRemark = NEW._SubmittedRemark,
				 xmor._AcceptedByID = OLD._ModBy,
				 xmor._AcceptedOn = OLD._ModDate,
				 xmor._AcceptedRemark = OLD._ProcessStepRemark,
				 xmor._ClosedOn = thecreationTime,
				 xmor._ClosedByID = NEW._ModBy,
				 xmor._ClosedRemark = NEW._ProcessStepRemark,
				 xmor._ModBy = NEW._ModBy,
				 xmor._ModDate = thecreationTime,
				 xmor._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xmor_l` SET
				
				 xmor_l._CollateralorderingID = registerRecordID,
				 
				 xmor_l._CollateralID = NEW._CollateralID,
				 xmor_l._CollateralCustomers = NEW._CollateralCustomers,
				 xmor_l._CollateralorderingQuantity = NEW._CollateralorderingQuantity,
				 
				 xmor_l._OwnedBy = NEW._OwnedBy,
				 xmor_l._SubmittedOn = NEW._SubmittedOn,
				 xmor_l._SubmittedRemark = NEW._SubmittedRemark,
				 xmor_l._AcceptedByID = OLD._ModBy,
				 xmor_l._AcceptedOn = OLD._ModDate,
				 xmor_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xmor_l._ClosedOn = thecreationTime,
				 xmor_l._ClosedByID = NEW._ModBy,
				 xmor_l._ClosedRemark = NEW._ProcessStepRemark,
				 xmor_l._ModBy = NEW._ModBy,
				 xmor_l._ModDate = thecreationTime,
				 xmor_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
/* xmo  END */

/* xi START */
DROP TRIGGER IF EXISTS xi_beupd //
CREATE TRIGGER xi_beupd BEFORE UPDATE ON `xi` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  _InternalorderHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE InvoiceApprover = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE InvoiceDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;					
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF; 
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xi_afupd //
CREATE TRIGGER xi_afupd AFTER UPDATE ON `xi` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _HelpticketIDfor PKF field !
	SELECT NEW._InvoiceID 	
	 INTO theRecordID;
	SELECT 'xi' 	
	 INTO theModuleID;
	-- SELECT 'InternalorderDecisionmaker' 	
	-- INTO Decisionmakers;
	SELECT NEW._SupervisorID
	 INTO Decisionmaker; 
	SELECT 'InvoiceApprover' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
			
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				-- SET Receivers = Decisionmakers;
				SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xir` SET
				
				 xir._InvoiceNumber = NEW._InvoiceNumber,
				 xir._InvoiceBruttoAmount = NEW._InvoiceBruttoAmount,
				 xir._InvoiceIssuedOn = NEW._InvoiceIssuedOn,
				 xir._InvoiceReceivedOn = NEW._InvoiceReceivedOn,
				 xir._InvoicePaymentOn = NEW._InvoicePaymentOn,
				 xir._InvoicePaymentID = NEW._InvoicePaymentID,
				 xir._InvoiceSellersNumber = NEW._InvoiceSellersNumber,
				 xir._InvoiceRemarks = NEW._InvoiceRemarks,
				 xir._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xir._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 xir._InvoiceTypeID = NEW._InvoiceTypeID,
				 
				 xir._OwnedBy = NEW._OwnedBy,
				 xir._SubmittedOn = NEW._SubmittedOn,
				 xir._SubmittedRemark = NEW._SubmittedRemark,
				 xir._AcceptedByID = OLD._ModBy,
				 xir._AcceptedOn = OLD._ModDate,
				 xir._AcceptedRemark = OLD._ProcessStepRemark,
				 xir._ClosedOn = thecreationTime,
				 xir._ClosedByID = NEW._ModBy,
				 xir._ClosedRemark = NEW._ProcessStepRemark,
				 xir._ModBy = NEW._ModBy,
				 xir._ModDate = thecreationTime,
				 xir._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xir_l` SET
				
				 xir_l._InvoiceID = registerRecordID,
				 
				 xir_l._InvoiceNumber = NEW._InvoiceNumber,
				 xir_l._InvoiceBruttoAmount = NEW._InvoiceBruttoAmount,
				 xir_l._InvoiceIssuedOn = NEW._InvoiceIssuedOn,
				 xir_l._InvoiceReceivedOn = NEW._InvoiceReceivedOn,
				 xir_l._InvoicePaymentOn = NEW._InvoicePaymentOn,
				 xir_l._InvoicePaymentID = NEW._InvoicePaymentID,
				 xir_l._InvoiceSellersNumber = NEW._InvoiceSellersNumber,
				 xir_l._InvoiceRemarks = NEW._InvoiceRemarks,
				 xir_l._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xir_l._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 xir_l._InvoiceTypeID = NEW._InvoiceTypeID,
				 
				 xir_l._OwnedBy = NEW._OwnedBy,	
				 xir_l._SubmittedOn = NEW._SubmittedOn,
				 xir_l._SubmittedRemark = NEW._SubmittedRemark,
				 xir_l._AcceptedByID = OLD._ModBy,
				 xir_l._AcceptedOn = OLD._ModDate,
				 xir_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xir_l._ClosedOn = thecreationTime,
				 xir_l._ClosedByID = NEW._ModBy,
				 xir_l._ClosedRemark = NEW._ProcessStepRemark,
				 xir_l._ModBy = NEW._ModBy,
				 xir_l._ModDate = thecreationTime,
				 xir_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xi END */

/* xir START */
DROP TRIGGER IF EXISTS xir_afins //
CREATE TRIGGER xir_afins AFTER INSERT ON `xir` FOR EACH ROW
BEGIN
    
	DECLARE recordDescrition text;	
	SET recordDescrition = CONCAT( NEW._InvoiceSellersNumber, ' | ', NEW._InvoiceNumber );
	
	CALL assign_register_handler( 
	 NEW._InvoiceID, 'xir', 'InvoiceHandler' , recordDescrition, NEW._ModBy );
	
END;//
/* xir END */

/* xii START */
DROP TRIGGER IF EXISTS xii_beupd //
CREATE TRIGGER xii_beupd BEFORE UPDATE ON `xii` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  _InternalorderHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE IncominginvoiceApprover = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE InvoiceDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;					
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF; 
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xii_afupd //
CREATE TRIGGER xii_afupd AFTER UPDATE ON `xii` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE xiirnRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _HelpticketIDfor PKF field !
	SELECT NEW._InvoiceID 	
	 INTO theRecordID;
	SELECT 'xii' 	
	 INTO theModuleID;
	-- SELECT 'InternalorderDecisionmaker' 	
	-- INTO Decisionmakers;
	SELECT NEW._SupervisorID
	 INTO Decisionmaker; 
	SELECT 'IncominginvoiceApprover' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
			
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				-- SET Receivers = Decisionmakers;
				SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			 
			-- additing to xiirn for ntf duplicating
			INSERT `xiirn` SET 	 
			 xiirn.ProcessStateID = NEW._ProcessStateID,
			 xiirn._IncomingInvoiceID = NEW._IncomingInvoiceID,
			 xiirn.ActionID = theRecordID,
			 xiirn.Remark = NEW._ProcessStepRemark,
			 xiirn._OwnedBy = NEW._OwnedBy,
			 xiirn._ModBy = NEW._ModBy,
			 xiirn._ModDate = thecreationTime,
			 xiirn._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO xiirnRecordID;
			
			INSERT `xiirn_l` SET	 
			 xiirn_l.ProcessStateID = NEW._ProcessStateID,
			 xiirn_l._IncomingInvoiceID = NEW._IncomingInvoiceID,
			 xiirn_l.ActionID = theRecordID,
			 xiirn_l.Remark = NEW._ProcessStepRemark,
			 xiirn_l._OwnedBy = NEW._OwnedBy,
			 xiirn_l._ModBy = NEW._ModBy,
			 xiirn_l._ModDate = thecreationTime,
			 xiirn_l._Deleted = 0,
			 xiirn_l.NotificationID = xiirnRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xiirr` SET
				
				 xiirr._InvoiceNumber = NEW._InvoiceNumber,
				 xiirr._InvoiceNettoAmount = NEW._InvoiceNettoAmount,
				 xiirr._InvoiceBruttoAmount = NEW._InvoiceBruttoAmount,
				 xiirr._InvoiceIssuedOn = NEW._InvoiceIssuedOn,
				 xiirr._InvoiceReceivedOn = NEW._InvoiceReceivedOn,
				 xiirr._InvoicePaymentOn = NEW._InvoicePaymentOn,
				 xiirr._InvoicePaymentID = NEW._InvoicePaymentID,
				 xiirr._InvoiceSellersNumber = NEW._InvoiceSellersNumber,
				 xiirr._InvoiceRemarks = NEW._InvoiceRemarks,
				 xiirr._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xiirr._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 xiirr._InvoiceTypeID = NEW._InvoiceTypeID,
				 xiirr._IncomingInvoiceID = NEW._IncomingInvoiceID,
				 
				 xiirr._OwnedBy = NEW._OwnedBy,	
				 xiirr._SubmittedOn = NEW._SubmittedOn,
				 xiirr._SubmittedRemark = NEW._SubmittedRemark,
				 xiirr._AcceptedByID = OLD._ModBy,
				 xiirr._AcceptedOn = OLD._ModDate,
				 xiirr._AcceptedRemark = OLD._ProcessStepRemark,
				 xiirr._ClosedOn = thecreationTime,
				 xiirr._ClosedByID = NEW._ModBy,
				 xiirr._ClosedRemark = NEW._ProcessStepRemark,
				 xiirr._ModBy = NEW._ModBy,
				 xiirr._ModDate = thecreationTime,
				 xiirr._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xiirr_l` SET
				
				 xiirr_l._InvoiceID = registerRecordID,
				 
				 xiirr_l._InvoiceNumber = NEW._InvoiceNumber,
				 xiirr_l._InvoiceNettoAmount = NEW._InvoiceNettoAmount,
				 xiirr_l._InvoiceBruttoAmount = NEW._InvoiceBruttoAmount,
				 xiirr_l._InvoiceIssuedOn = NEW._InvoiceIssuedOn,
				 xiirr_l._InvoiceReceivedOn = NEW._InvoiceReceivedOn,
				 xiirr_l._InvoicePaymentOn = NEW._InvoicePaymentOn,
				 xiirr_l._InvoicePaymentID = NEW._InvoicePaymentID,
				 xiirr_l._InvoiceSellersNumber = NEW._InvoiceSellersNumber,
				 xiirr_l._InvoiceRemarks = NEW._InvoiceRemarks,
				 xiirr_l._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xiirr_l._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 xiirr_l._InvoiceTypeID = NEW._InvoiceTypeID,
				 xiirr_l._IncomingInvoiceID = NEW._IncomingInvoiceID,
				 
				 xiirr_l._OwnedBy = NEW._OwnedBy,
				 xiirr_l._SubmittedOn = NEW._SubmittedOn,
				 xiirr_l._SubmittedRemark = NEW._SubmittedRemark,
				 xiirr_l._AcceptedByID = OLD._ModBy,
				 xiirr_l._AcceptedOn = OLD._ModDate,
				 xiirr_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xiirr_l._ClosedOn = thecreationTime,
				 xiirr_l._ClosedByID = NEW._ModBy,
				 xiirr_l._ClosedRemark = NEW._ProcessStepRemark,
				 xiirr_l._ModBy = NEW._ModBy,
				 xiirr_l._ModDate = thecreationTime,
				 xiirr_l._Deleted = 0;
				
				UPDATE `xiir` SET  xiir._InvoiceStatusID = 4 WHERE xiir._InvoiceID = NEW._IncomingInvoiceID;
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;

			-- additing to xiirn for deleting
			INSERT `xiirn` SET 	 
			 xiirn.ProcessStateID = 11,
			 xiirn._IncomingInvoiceID = NEW._IncomingInvoiceID,
			 xiirn.ActionID = theRecordID,
			 xiirn._OwnedBy = NEW._OwnedBy,
			 xiirn._ModBy = NEW._ModBy,
			 xiirn._ModDate = thecreationTime,
			 xiirn._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO xiirnRecordID;
			
			INSERT `xiirn_l` SET	 
			 xiirn_l.ProcessStateID = 11,
			 xiirn_l._IncomingInvoiceID = NEW._IncomingInvoiceID,
			 xiirn_l.ActionID = theRecordID,
			 xiirn_l._OwnedBy = NEW._OwnedBy,
			 xiirn_l._ModBy = NEW._ModBy,
			 xiirn_l._ModDate = thecreationTime,
			 xiirn_l._Deleted = 0,
			 xiirn_l.NotificationID = xiirnRecordID;
			
			-- updating invoice status in Incoming invoice registration
			UPDATE `xiir` SET  xiir._InvoiceStatusID = 3 WHERE xiir._InvoiceID = NEW._IncomingInvoiceID;
			
	END IF;
END;//
 
/* xii END */

/* xiir START*/
DROP TRIGGER IF EXISTS xiir_beupd //
CREATE TRIGGER xiir_beupd BEFORE UPDATE ON `xiir` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN		

		IF ( NEW._OwnedBy != OLD._OwnedBy ) THEN 
			IF OLD._InvoiceStatusID IN (1,3)  THEN
				SET NEW._InvoiceStatusID = 2;		
			ELSE		
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3024` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
	END IF;
END;//

DROP TRIGGER IF EXISTS xiir_afupd //
CREATE TRIGGER xiir_afupd AFTER UPDATE ON `xiir` FOR EACH ROW
BEGIN
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE registerRecordID INT;
	DECLARE ntfRecordID INT;
	DECLARE xiirnRecordID INT;
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	SELECT NEW._InvoiceID 	
	 INTO theRecordID;
	SELECT 'xiir' 	
	 INTO theModuleID;	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN		

			IF ( NEW._OwnedBy != OLD._OwnedBy ) AND ( OLD._InvoiceStatusID IN (1,3,4) ) THEN
				
				INSERT `xii` SET
				
				 xii._InvoiceNumber = NEW._InvoiceNumber,
				 xii._InvoiceNettoAmount = NEW._InvoiceNettoAmount,
				 xii._InvoiceBruttoAmount = NEW._InvoiceBruttoAmount,
				 xii._InvoiceIssuedOn = NEW._InvoiceIssuedOn,
				 xii._InvoiceReceivedOn = NEW._InvoiceReceivedOn,
				 xii._InvoicePaymentOn = NEW._InvoicePaymentOn,
				 xii._InvoicePaymentID = NEW._InvoicePaymentID,
				 xii._InvoiceSellersNumber = NEW._InvoiceSellersNumber,
				 xii._InvoiceRemarks = NEW._InvoiceRemarks,				 
				 xii._InvoiceTypeID = NEW._InvoiceTypeID,
				 xii._IncomingInvoiceID = NEW._InvoiceID,
				 xii._ProcessStateID = 1,
				 
				 xii._OwnedBy = NEW._OwnedBy,
				 xii._ModBy = NEW._ModBy,
				 xii._ModDate = thecreationTime,
				 xii._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xii_l` SET
				
				 xii_l._InvoiceID = registerRecordID,
				 
				 xii_l._InvoiceNumber = NEW._InvoiceNumber,
				 xii_l._InvoiceNettoAmount = NEW._InvoiceNettoAmount,
				 xii_l._InvoiceBruttoAmount = NEW._InvoiceBruttoAmount,
				 xii_l._InvoiceIssuedOn = NEW._InvoiceIssuedOn,
				 xii_l._InvoiceReceivedOn = NEW._InvoiceReceivedOn,
				 xii_l._InvoicePaymentOn = NEW._InvoicePaymentOn,
				 xii_l._InvoicePaymentID = NEW._InvoicePaymentID,
				 xii_l._InvoiceSellersNumber = NEW._InvoiceSellersNumber,
				 xii_l._InvoiceRemarks = NEW._InvoiceRemarks,				 
				 xii_l._InvoiceTypeID = NEW._InvoiceTypeID,
				 xii_l._IncomingInvoiceID = NEW._InvoiceID,
				 xii_l._ProcessStateID = 1,
				 
				 xii_l._OwnedBy = NEW._OwnedBy,
				 xii_l._ModBy = NEW._ModBy,
				 xii_l._ModDate = thecreationTime,
				 xii_l._Deleted = 0;			
			
						
				-- additing to ntf for generating
				INSERT `ntf` SET 	 
				 ntf.ProcessStateID = 10,
				 ntf.RelatedRecordID = registerRecordID,
				 ntf.RelatedModuleID = 'xii',
				 ntf.Remark = NEW._NextProcessStepRemark,
				 ntf._ModBy = NEW._ModBy,
				 ntf._ModDate = thecreationTime,
				 ntf._Deleted = 0;
				
				SELECT LAST_INSERT_ID() INTO ntfRecordID;
				
				INSERT `ntf_l` SET	 
				 ntf_l.ProcessStateID = 10,
				 ntf_l.RelatedRecordID = registerRecordID,
				 ntf_l.RelatedModuleID = 'xii',
				 ntf_l.Remark = NEW._NextProcessStepRemark,
				 ntf_l._ModBy = NEW._ModBy,
				 ntf_l._ModDate = thecreationTime,
				 ntf_l._Deleted = 0,
				 ntf_l.NotificationID = ntfRecordID;
				 
				-- additing to ntf for beeing not submitted 
				 INSERT `ntf` SET 
				 ntf.SendFlag = 1,
				 ntf.Receiver = NEW._OwnedBy,
				 ntf.OldProcessStateID = 10,				 
				 ntf.ProcessStateID = 1,
				 ntf.RelatedRecordID = registerRecordID,
				 ntf.RelatedModuleID = 'xii',
				 ntf._ModBy = NEW._OwnedBy,
				 ntf._ModDate = thecreationTime,
				 ntf._Deleted = 0;
				
				SELECT LAST_INSERT_ID() INTO ntfRecordID;
				
				INSERT `ntf_l` SET	
				 ntf_l.SendFlag = 1,
				 ntf_l.Receiver = NEW._OwnedBy,	
				 ntf_l.OldProcessStateID = 10,				 
				 ntf_l.ProcessStateID = 1,
				 ntf_l.RelatedRecordID = registerRecordID,
				 ntf_l.RelatedModuleID = 'xii',
				 ntf_l._ModBy = NEW._OwnedBy,
				 ntf_l._ModDate = thecreationTime,
				 ntf_l._Deleted = 0,
				 ntf_l.NotificationID = ntfRecordID;
				 
				-- additing to xiirn for generating
				INSERT `xiirn` SET 	 
				 xiirn.ProcessStateID = 10,
				 xiirn._IncomingInvoiceID = theRecordID,
				 xiirn.ActionID = registerRecordID,
				 xiirn.Remark = NEW._NextProcessStepRemark,
				 xiirn._OwnedBy = NEW._OwnedBy,
				 xiirn._ModBy = NEW._ModBy,
				 xiirn._ModDate = thecreationTime,
				 xiirn._Deleted = 0;
				
				SELECT LAST_INSERT_ID() INTO xiirnRecordID;
				
				INSERT `xiirn_l` SET	 
				 xiirn_l.ProcessStateID = 10,
				 xiirn_l._IncomingInvoiceID = theRecordID,
				 xiirn_l.ActionID = registerRecordID,
				 xiirn_l.Remark = NEW._NextProcessStepRemark,
				 xiirn_l._OwnedBy = NEW._OwnedBy,
				 xiirn_l._ModBy = NEW._ModBy,
				 xiirn_l._ModDate = thecreationTime,
				 xiirn_l._Deleted = 0,
				 xiirn_l.NotificationID = xiirnRecordID;
				
				-- additing to xiirn for for beeing not submitted 
				INSERT `xiirn` SET 	 
				 xiirn.ProcessStateID = 1,
				 xiirn._IncomingInvoiceID = theRecordID,
				 xiirn.ActionID = registerRecordID,
				 xiirn._OwnedBy = NEW._OwnedBy,
				 xiirn._ModBy = NEW._OwnedBy,
				 xiirn._ModDate = thecreationTime,
				 xiirn._Deleted = 0;
				
				SELECT LAST_INSERT_ID() INTO xiirnRecordID;
				
				INSERT `xiirn_l` SET	 
				 xiirn_l.ProcessStateID = 1,
				 xiirn_l._IncomingInvoiceID = theRecordID,
				 xiirn_l.ActionID = registerRecordID,
				 xiirn_l._OwnedBy = NEW._OwnedBy,
				 xiirn_l._ModBy = NEW._OwnedBy,
				 xiirn_l._ModDate = thecreationTime,
				 xiirn_l._Deleted = 0,
				 xiirn_l.NotificationID = xiirnRecordID;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xiir END */

/* xiirr START */
DROP TRIGGER IF EXISTS xiirr_afins //
CREATE TRIGGER xiirr_afins AFTER INSERT ON `xiirr` FOR EACH ROW
BEGIN
    
	DECLARE recordDescrition text;	
	SET recordDescrition = CONCAT( NEW._InvoiceSellersNumber, ' | ', NEW._InvoiceNumber );
	
	CALL assign_register_handler( 
	 NEW._InvoiceID, 'xiirr', 'IncominginvoiceHandler' , recordDescrition, NEW._ModBy );
	
END;//
/* xiirr END */

/* xbto START */
DROP TRIGGER IF EXISTS xbtor_afins //
CREATE TRIGGER xbtor_afins AFTER INSERT ON `xbtor` FOR EACH ROW
BEGIN
    DECLARE recordDescrition text;	
	SET recordDescrition = CONCAT( NEW._BusinesstripBegin, ' | ', NEW._BusinesstripFinish );
	
	CALL assign_register_handler( 
	 NEW._BusinesstripID, 'xbtor', 'BusinesstripHandler' , recordDescrition, NEW._ModBy );
	
END;//

DROP TRIGGER IF EXISTS xbto_beupd //
CREATE TRIGGER xbto_beupd BEFORE UPDATE ON `xbto` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  BusinesstripHandlerswaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE BusinesstripHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  _SupervisorID swaped or implementation as isHandler
	SELECT NEW._ModBy = NEW._SupervisorID	
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
		 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	-- swap  _VacationID for PKF field !
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
	
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 5 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 6 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;

			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xbto_afupd //
CREATE TRIGGER xbto_afupd AFTER UPDATE ON `xbto` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _VacationID for PKF field !	
	SELECT NEW._BusinesstripID	
	 INTO theRecordID;
	SELECT 'xbto' 	
	 INTO theModuleID;
	SELECT 'BusinesstripDecisionmaker' 	
	 INTO Decisionmakers;
	SELECT NEW._SupervisorID
	 INTO Decisionmaker; 
	SELECT 'BusinesstripHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
		
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				-- SET Receivers = Decisionmakers;
				SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			 
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xbtor` SET
				
				 xbtor._BusinesstripDestination= NEW._BusinesstripDestination,
				 xbtor._BusinesstripBegin = NEW._BusinesstripBegin,
				 xbtor._BusinesstripFinish = NEW._BusinesstripFinish,
				 xbtor._BusinesstripObjective = NEW._BusinesstripObjective,
				 xbtor._BusinesstripTransportation = NEW._BusinesstripTransportation,
				 
				 xbtor._OwnedBy = NEW._OwnedBy,
				 xbtor._SubmittedOn = NEW._SubmittedOn,
				 xbtor._SubmittedRemark = NEW._SubmittedRemark,
				 xbtor._AcceptedByID = NEW._ModBy,
				 xbtor._AcceptedOn = NEW._ModDate,
				 xbtor._AcceptedRemark = NEW._ProcessStepRemark,
				 xbtor._ClosedOn = thecreationTime,
				 xbtor._ClosedByID = NEW._ModBy,
				 xbtor._ClosedRemark = NEW._ProcessStepRemark,
				 xbtor._ModBy = NEW._ModBy,
				 xbtor._ModDate = thecreationTime,
				 xbtor._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO registerRecordID;
			
			INSERT `xbtor_l` SET
				
				 xbtor_l._BusinesstripID = registerRecordID,
				 
				 xbtor_l._BusinesstripDestination= NEW._BusinesstripDestination,
				 xbtor_l._BusinesstripBegin = NEW._BusinesstripBegin,
				 xbtor_l._BusinesstripFinish = NEW._BusinesstripFinish,
				 xbtor_l._BusinesstripObjective = NEW._BusinesstripObjective,
				 xbtor_l._BusinesstripTransportation = NEW._BusinesstripTransportation,
				 
				 xbtor_l._OwnedBy = NEW._OwnedBy,
				 xbtor_l._SubmittedOn = NEW._SubmittedOn,
				 xbtor_l._SubmittedRemark = NEW._SubmittedRemark,
				 xbtor_l._AcceptedByID = NEW._ModBy,
				 xbtor_l._AcceptedOn = NEW._ModDate,
				 xbtor_l._AcceptedRemark = NEW._ProcessStepRemark,
				 xbtor_l._ClosedOn = thecreationTime,
				 xbtor_l._ClosedByID = NEW._ModBy,
				 xbtor_l._ClosedRemark = NEW._ProcessStepRemark,
				 xbtor_l._ModBy = NEW._ModBy,
				 xbtor_l._ModDate = thecreationTime,
				 xbtor_l._Deleted = 0;
						
			END IF;
		END IF;		
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xbto END */

/* xbter START */
DROP TRIGGER IF EXISTS xbter_afins //
CREATE TRIGGER xbter_afins AFTER INSERT ON `xbter` FOR EACH ROW
BEGIN
    DECLARE recordDescrition text;	
	SET recordDescrition = CONCAT( NEW._BusinesstripBegin, ' | ', NEW._BusinesstripFinish );
	
	CALL assign_register_handler( 
	 NEW._TripexpensesID, 'xbter', 'TripexpensesHandler' , recordDescrition, NEW._ModBy );
	
END;//


DROP TRIGGER IF EXISTS xbter_beupd //
CREATE TRIGGER xbter_beupd BEFORE UPDATE ON `xbter` FOR EACH ROW
BEGIN
-- OnInsert data the calculation is done by xbte
	DECLARE travelDays INT;
	DECLARE travelHours INT;
	DECLARE travelAllowanceCount FLOAT;
	DECLARE TravelAllowance DECIMAL(12,4);
	DECLARE HotelAllowance DECIMAL(12,4);
	DECLARE CommutingAllowance DECIMAL(12,4);
	DECLARE travelMinutes INT;
	DECLARE BusinesstripBegin DATE;
	DECLARE dataDelta INT;
	DECLARE allowancesetID INT;
	DECLARE WayAllowance  DECIMAL(12,4);
	DECLARE vehicleallowanceID INT;
	DECLARE TransportationID INT;
	
	SET BusinesstripBegin = NEW._BusinesstripBegin;	
	
	SELECT  xbtea._AllowancesetID, xbtea._TravelAllowance, xbtea._HotelAllowance, xbtea._CommutingAllowance,
		TIMESTAMPDIFF( second, _AllowancesetValidFrom, BusinesstripBegin ) as _dataDelta		
	  INTO  allowancesetID, TravelAllowance, HotelAllowance, CommutingAllowance, dataDelta FROM xbtea 
	  WHERE xbtea._Deleted = 0 AND TIMESTAMPDIFF(second, _AllowancesetValidFrom, BusinesstripBegin ) >= 0
	  ORDER BY _dataDelta asc, _AllowancesetID desc LIMIT 1;	
	
	-- travel allowance	
	SET travelMinutes = TIMESTAMPDIFF( MINUTE, NEW._BusinesstripBegin, NEW._BusinesstripFinish );
	SET travelDays = FLOOR( travelMinutes / 1440 );
	SET travelHours = CEIL( ( travelMinutes % 1440 )/60 );	
	SET travelAllowanceCount = 0;
	
	IF NEW._Fullcatering = 0 THEN 
		IF travelDays = 0 AND ( 8 < travelHours  AND travelHours <= 12) THEN 
			SET travelAllowanceCount = 0.5;
		END IF;
		IF travelDays = 0 AND ( 12 < travelHours ) THEN 
			SET travelAllowanceCount = 1;
		END IF;
		IF travelDays > 0 AND (  travelHours <=8 ) THEN 
			SET travelAllowanceCount = travelDays + 0.5;
		END IF;
		IF travelDays > 0 AND (  8 < travelHours ) THEN 
			SET travelAllowanceCount = travelDays + 1;
		END IF;
	END IF;
	
	SET NEW._TravelAllowanceCount= IFNULL( NEW._TravelAllowanceCount, travelAllowanceCount );
	SET NEW._TravelAllowance= IFNULL( NEW._TravelAllowance, travelAllowance );
	SET NEW._TravelAllowanceTotal = NEW._TravelAllowanceCount * NEW._travelAllowance;
	SET NEW._TravelAllowanceTotal= IFNULL( NEW._TravelAllowanceTotal, 0 );
	
	-- hotel allowance	
	SET NEW._HotelAllowance = HotelAllowance;
	SET NEW._HotelAllowanceTotal = NEW._HotelAllowanceCount * NEW._HotelAllowance;
	SET NEW._HotelAllowanceTotal = IFNULL( NEW._HotelAllowanceTotal, 0 );
	
	-- commuting allowance
	SET NEW._CommutingAllowance = CommutingAllowance;  
	SET NEW._CommutingAllowanceTotal = NEW._CommutingAllowanceCount * NEW._CommutingAllowance;
	SET NEW._CommutingAllowanceTotal = IFNULL(  NEW._CommutingAllowanceTotal, 0 );
	
	-- trasnporation allowance
	SET TransportationID = NEW._TransportationID;
	IF TransportationID != 1 THEN
		SELECT  xbtev._VehicleallowanceID, xbtev._WayAllowance,
			TIMESTAMPDIFF( second, _VehicleallowanceValidFrom, BusinesstripBegin ) as _dataDelta		
		  INTO  vehicleallowanceID, WayAllowance, dataDelta FROM xbtev 
		  WHERE xbtev._Deleted = 0 AND TransportationID = xbtev._TransportationID
		  AND TIMESTAMPDIFF(second, _VehicleallowanceValidFrom, BusinesstripBegin ) >= 0		  
		  ORDER BY _dataDelta asc, _VehicleallowanceID desc LIMIT 1;	
		
		SET NEW._WayCount = 
			  IFNULL( NEW._RouteCount1, 0 )
			+ IFNULL( NEW._RouteCount2, 0 )
			+ IFNULL( NEW._RouteCount3, 0 )
			+ IFNULL( NEW._RouteCount4, 0 )
			+ IFNULL( NEW._RouteCount5, 0 );		
		SET NEW._WayAllowance = WayAllowance;		
		SET NEW._WayTotal = NEW._WayCount * WayAllowance;
		SET NEW._WayTotal = IFNULL( NEW._WayTotal, 0 );
	ELSE 
		SET NEW._WayAllowance = NULL;
		SET NEW._WayCount = NULL;
		SET NEW._WayTotal = 0;
	END IF;	
	
	
	-- Business trip total expenenses 
	
	SET NEW._BusinesstripTotal = 
		  NEW._CommutingAllowanceTotal
		+ NEW._TravelAllowanceTotal
		+ NEW._HotelAllowanceTotal
		+ NEW._WayTotal;
		
END;//

/* xbter END */

/* xbte START */
DROP TRIGGER IF EXISTS xbte_beins //
CREATE TRIGGER xbte_beins BEFORE INSERT ON `xbte` FOR EACH ROW
BEGIN

	DECLARE travelDays INT;
	DECLARE travelHours INT;
	DECLARE travelAllowanceCount FLOAT;
	DECLARE TravelAllowance DECIMAL(12,4);
	DECLARE HotelAllowance DECIMAL(12,4);
	DECLARE CommutingAllowance DECIMAL(12,4);
	DECLARE travelMinutes INT;
	DECLARE BusinesstripBegin DATE;
	DECLARE dataDelta INT;
	DECLARE allowancesetID INT;
	DECLARE WayAllowance  DECIMAL(12,4);
	DECLARE vehicleallowanceID INT;
	DECLARE TransportationID INT;
	
	SET BusinesstripBegin = NEW._BusinesstripBegin;	
	
	SELECT  xbtea._AllowancesetID, xbtea._TravelAllowance, xbtea._HotelAllowance, xbtea._CommutingAllowance,
		TIMESTAMPDIFF( second, _AllowancesetValidFrom, BusinesstripBegin ) as _dataDelta		
	  INTO  allowancesetID, TravelAllowance, HotelAllowance, CommutingAllowance, dataDelta FROM xbtea 
	  WHERE xbtea._Deleted = 0 AND TIMESTAMPDIFF(second, _AllowancesetValidFrom, BusinesstripBegin ) >= 0
	  ORDER BY _dataDelta asc, _AllowancesetID desc LIMIT 1;	
	
	-- travel allowance	
	SET travelMinutes = TIMESTAMPDIFF( MINUTE, NEW._BusinesstripBegin, NEW._BusinesstripFinish );
	SET travelDays = FLOOR( travelMinutes / 1440 );
	SET travelHours = CEIL( ( travelMinutes % 1440 )/60 );	
	SET travelAllowanceCount = 0;
	
	IF NEW._Fullcatering = 0 THEN 
		IF travelDays = 0 AND ( 8 < travelHours  AND travelHours <= 12) THEN 
			SET travelAllowanceCount = 0.5;
		END IF;
		IF travelDays = 0 AND ( 12 < travelHours ) THEN 
			SET travelAllowanceCount = 1;
		END IF;
		IF travelDays > 0 AND (  travelHours <=8 ) THEN 
			SET travelAllowanceCount = travelDays + 0.5;
		END IF;
		IF travelDays > 0 AND (  8 < travelHours ) THEN 
			SET travelAllowanceCount = travelDays + 1;
		END IF;
	END IF;
	
	SET NEW._TravelAllowanceCount = travelAllowanceCount;
	SET NEW._TravelAllowance = TravelAllowance;
	SET NEW._TravelAllowanceTotal = travelAllowanceCount * NEW._TravelAllowance;
	SET NEW._TravelAllowanceTotal= IFNULL( NEW._TravelAllowanceTotal, 0 );
	
	-- hotel allowance	
	SET NEW._HotelAllowance = HotelAllowance;
	SET NEW._HotelAllowanceTotal = NEW._HotelAllowanceCount * NEW._HotelAllowance;
	SET NEW._HotelAllowanceTotal = IFNULL( NEW._HotelAllowanceTotal, 0 );
	
	-- commuting allowance
	SET NEW._CommutingAllowance = CommutingAllowance;  
	SET NEW._CommutingAllowanceTotal = NEW._CommutingAllowanceCount * NEW._CommutingAllowance;
	SET NEW._CommutingAllowanceTotal = IFNULL(  NEW._CommutingAllowanceTotal, 0 );
	
	-- trasnporation allowance
	SET TransportationID = NEW._TransportationID;
	IF TransportationID != 1 THEN
		SELECT  xbtev._VehicleallowanceID, xbtev._WayAllowance,
			TIMESTAMPDIFF( second, _VehicleallowanceValidFrom, BusinesstripBegin ) as _dataDelta		
		  INTO  vehicleallowanceID, WayAllowance, dataDelta FROM xbtev 
		  WHERE xbtev._Deleted = 0 AND TransportationID = xbtev._TransportationID
		  AND TIMESTAMPDIFF(second, _VehicleallowanceValidFrom, BusinesstripBegin ) >= 0		  
		  ORDER BY _dataDelta asc, _VehicleallowanceID desc LIMIT 1;	
		
		SET NEW._WayCount = 
			  IFNULL( NEW._RouteCount1, 0 )
			+ IFNULL( NEW._RouteCount2, 0 )
			+ IFNULL( NEW._RouteCount3, 0 )
			+ IFNULL( NEW._RouteCount4, 0 )
			+ IFNULL( NEW._RouteCount5, 0 );		
		SET NEW._WayAllowance = WayAllowance;		
		SET NEW._WayTotal = NEW._WayCount * WayAllowance;
		SET NEW._WayTotal = IFNULL( NEW._WayTotal, 0 );
	ELSE 
		SET NEW._WayAllowance = NULL;
		SET NEW._WayCount = NULL;
		SET NEW._WayTotal = 0;
	END IF;	
	
	
	-- Business trip total expenenses 
	
	SET NEW._BusinesstripTotal = 
		  NEW._CommutingAllowanceTotal
		+ NEW._TravelAllowanceTotal
		+ NEW._HotelAllowanceTotal
		+ NEW._WayTotal;
		
END;//

DROP TRIGGER IF EXISTS xbte_beupd //
CREATE TRIGGER xbte_beupd BEFORE UPDATE ON `xbte` FOR EACH ROW
BEGIN
	
	-- Businees trip expenses
	DECLARE travelDays INT;
	DECLARE travelHours INT;
	DECLARE travelAllowanceCount FLOAT;
	DECLARE TravelAllowance DECIMAL(12,4);
	DECLARE HotelAllowance DECIMAL(12,4);
	DECLARE CommutingAllowance DECIMAL(12,4);
	DECLARE travelMinutes INT;
	DECLARE BusinesstripBegin DATE;
	DECLARE dataDelta INT;
	DECLARE allowancesetID INT;
	DECLARE WayAllowance  DECIMAL(12,4);
	DECLARE vehicleallowanceID INT;
	DECLARE TransportationID INT;
	
	-- WORKFLOW 
	DECLARE dummy INT;
	
	DECLARE changeState INT;
	DECLARE nextprocessState INT;
	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;	
	
	-- /* Business trip expenses calculation
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN			
			
			SET BusinesstripBegin = NEW._BusinesstripBegin;	
			
			SELECT  xbtea._AllowancesetID, xbtea._TravelAllowance, xbtea._HotelAllowance, xbtea._CommutingAllowance,
				TIMESTAMPDIFF( second, _AllowancesetValidFrom, BusinesstripBegin ) as _dataDelta		
			  INTO  allowancesetID, TravelAllowance, HotelAllowance, CommutingAllowance, dataDelta FROM xbtea 
			  WHERE xbtea._Deleted = 0 AND TIMESTAMPDIFF(second, _AllowancesetValidFrom, BusinesstripBegin ) >= 0
			  ORDER BY _dataDelta asc, _AllowancesetID desc LIMIT 1;	
			
			-- travel allowance	
			SET travelMinutes = TIMESTAMPDIFF( MINUTE, NEW._BusinesstripBegin, NEW._BusinesstripFinish );
			SET travelDays = FLOOR( travelMinutes / 1440 );
			SET travelHours = CEIL( ( travelMinutes % 1440 )/60 );	
			SET travelAllowanceCount = 0;
			
			IF NEW._Fullcatering = 0 THEN 
				IF travelDays = 0 AND ( 8 < travelHours  AND travelHours <= 12) THEN 
					SET travelAllowanceCount = 0.5;
				END IF;
				IF travelDays = 0 AND ( 12 < travelHours ) THEN 
					SET travelAllowanceCount = 1;
				END IF;
				IF travelDays > 0 AND (  travelHours <=8 ) THEN 
					SET travelAllowanceCount = travelDays + 0.5;
				END IF;
				IF travelDays > 0 AND (  8 < travelHours ) THEN 
					SET travelAllowanceCount = travelDays + 1;
				END IF;
			END IF;
			
			SET NEW._TravelAllowanceCount = travelAllowanceCount;
			SET NEW._TravelAllowance = TravelAllowance;
			SET NEW._TravelAllowanceTotal = travelAllowanceCount * NEW._TravelAllowance;
			SET NEW._TravelAllowanceTotal= IFNULL( NEW._TravelAllowanceTotal, 0 );
			
			-- hotel allowance	
			SET NEW._HotelAllowance = HotelAllowance;
			SET NEW._HotelAllowanceTotal = NEW._HotelAllowanceCount * NEW._HotelAllowance;
			SET NEW._HotelAllowanceTotal = IFNULL( NEW._HotelAllowanceTotal, 0 );
			
			-- commuting allowance
			SET NEW._CommutingAllowance = CommutingAllowance;  
			SET NEW._CommutingAllowanceTotal = NEW._CommutingAllowanceCount * NEW._CommutingAllowance;
			SET NEW._CommutingAllowanceTotal = IFNULL(  NEW._CommutingAllowanceTotal, 0 );
			
			-- trasnporation allowance
			SET TransportationID = NEW._TransportationID;
			IF TransportationID != 1 THEN
				SELECT  xbtev._VehicleallowanceID, xbtev._WayAllowance,
					TIMESTAMPDIFF( second, _VehicleallowanceValidFrom, BusinesstripBegin ) as _dataDelta		
				  INTO  vehicleallowanceID, WayAllowance, dataDelta FROM xbtev 
				  WHERE xbtev._Deleted = 0 AND TransportationID = xbtev._TransportationID
				  AND TIMESTAMPDIFF(second, _VehicleallowanceValidFrom, BusinesstripBegin ) >= 0		  
				  ORDER BY _dataDelta asc, _VehicleallowanceID desc LIMIT 1;	
				
				SET NEW._WayCount = 
					  IFNULL( NEW._RouteCount1, 0 )
					+ IFNULL( NEW._RouteCount2, 0 )
					+ IFNULL( NEW._RouteCount3, 0 )
					+ IFNULL( NEW._RouteCount4, 0 )
					+ IFNULL( NEW._RouteCount5, 0 );		
				SET NEW._WayAllowance = WayAllowance;		
				SET NEW._WayTotal = NEW._WayCount * WayAllowance;
				SET NEW._WayTotal = IFNULL( NEW._WayTotal, 0 );
			ELSE 
				SET NEW._WayAllowance = NULL;
				SET NEW._WayCount = NULL;
				SET NEW._WayTotal = 0;
			END IF;	
			
			
			-- Business trip total expenenses 
			
			SET NEW._BusinesstripTotal = 
				  NEW._CommutingAllowanceTotal
				+ NEW._TravelAllowanceTotal
				+ NEW._HotelAllowanceTotal
				+ NEW._WayTotal;

	END IF; 
	--  Business trip expenses calculation */
	
	--  /* WORKFLOW
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  BusinesstripHandlerswaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE TripexpensesApprover = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  _SupervisorID swaped or implementation as isHandler
	SELECT NEW._ModBy = NEW._SupervisorID	
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
		 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	-- swap  _VacationID for PKF field !
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
	
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
	END IF;
	--  WORKFLOW */
END;//
 

DROP TRIGGER IF EXISTS xbte_afupd //
CREATE TRIGGER xbte_afupd AFTER UPDATE ON `xbte` FOR EACH ROW
BEGIN
	
	-- WORKFLOW
	
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _VacationID for PKF field !	
	SELECT NEW._TripexpensesID	
	 INTO theRecordID;
	SELECT 'xbte' 	
	 INTO theModuleID;
	SELECT 'TripexpensesDecisionmaker' 	
	 INTO Decisionmakers;
	SELECT NEW._SupervisorID
	 INTO Decisionmaker; 
	SELECT 'TripexpensesApprover' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
		
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				-- SET Receivers = Decisionmakers;
				SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			 
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xbter` SET
				
				 xbter._BusinesstripDestination= NEW._BusinesstripDestination,
				 xbter._BusinesstripObjective = NEW._BusinesstripObjective,
				 xbter._BusinesstripBegin = NEW._BusinesstripBegin,
				 xbter._BusinesstripFinish = NEW._BusinesstripFinish,
				 xbter._Fullcatering = NEW._Fullcatering,				 
				 --  
				 xbter._TravelAllowance = NEW._TravelAllowance,
				 xbter._TravelAllowanceCount = NEW._TravelAllowanceCount,
				 xbter._TravelAllowanceTotal = NEW._TravelAllowanceTotal,
				 --  
				 xbter._HotelAllowance = NEW._HotelAllowance,
				 xbter._HotelAllowanceCount = NEW._HotelAllowanceCount,
				 xbter._HotelAllowanceTotal = NEW._HotelAllowanceTotal,
				 xbter._HotelAllowanceSubstantiation = NEW._HotelAllowanceSubstantiation,
				 --  
				 xbter._CommutingAllowance = NEW._CommutingAllowance,
				 xbter._CommutingAllowanceCount = NEW._CommutingAllowanceCount,
				 xbter._CommutingAllowanceTotal = NEW._CommutingAllowanceTotal,
				 xbter._CommutingAllowanceSubstantiation = NEW._CommutingAllowanceSubstantiation,
				 --  
				 xbter._TransportationID = NEW._TransportationID,
				 xbter._WayAllowance = NEW._WayAllowance,
				 xbter._WayCount = NEW._WayCount,
				 xbter._WayTotal = NEW._WayTotal,
				 xbter._RouteDescription1 = NEW._RouteDescription1,
				 xbter._RouteCount1 = NEW._RouteCount1,
				 xbter._RouteDescription2 = NEW._RouteDescription2,
				 xbter._RouteCount2 = NEW._RouteCount2,
				 xbter._RouteDescription3 = NEW._RouteDescription3,
				 xbter._RouteCount3 = NEW._RouteCount3,
				 xbter._RouteDescription4 = NEW._RouteDescription4,
				 xbter._RouteCount4 = NEW._RouteCount4,
				 xbter._RouteDescription5 = NEW._RouteDescription5,
				 xbter._RouteCount5 = NEW._RouteCount5,
				 -- 
				 xbter._BusinesstripRemarks = NEW._BusinesstripRemarks,
				 xbter._BusinesstripTotal = NEW._BusinesstripTotal,
				 --  
				 xbter._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xbter._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 --  
				 xbter._OwnedBy = NEW._OwnedBy,
				 xbter._SubmittedOn = NEW._SubmittedOn,
				 xbter._SubmittedRemark = NEW._SubmittedRemark,
				 xbter._AcceptedByID = OLD._ModBy,
				 xbter._AcceptedOn = OLD._ModDate,
				 xbter._AcceptedRemark = OLD._ProcessStepRemark,
				 xbter._ClosedOn = thecreationTime,
				 xbter._ClosedByID = NEW._ModBy,
				 xbter._ClosedRemark = NEW._ProcessStepRemark,
				 xbter._ModBy = NEW._ModBy,
				 xbter._ModDate = thecreationTime,
				 xbter._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO registerRecordID;
			
			INSERT `xbter_l` SET
				
				 xbter_l._TripexpensesID = registerRecordID,
				 
				 xbter_l._BusinesstripDestination= NEW._BusinesstripDestination,
				 xbter_l._BusinesstripObjective = NEW._BusinesstripObjective,
				 xbter_l._BusinesstripBegin = NEW._BusinesstripBegin,
				 xbter_l._BusinesstripFinish = NEW._BusinesstripFinish,
				 xbter_l._Fullcatering = NEW._Fullcatering,				 
				 --  
				 xbter_l._TravelAllowance = NEW._TravelAllowance,
				 xbter_l._TravelAllowanceCount = NEW._TravelAllowanceCount,
				 xbter_l._TravelAllowanceTotal = NEW._TravelAllowanceTotal,
				 --  
				 xbter_l._HotelAllowance = NEW._HotelAllowance,
				 xbter_l._HotelAllowanceCount = NEW._HotelAllowanceCount,
				 xbter_l._HotelAllowanceTotal = NEW._HotelAllowanceTotal,
				 xbter_l._HotelAllowanceSubstantiation = NEW._HotelAllowanceSubstantiation,
				 --  
				 xbter_l._CommutingAllowance = NEW._CommutingAllowance,
				 xbter_l._CommutingAllowanceCount = NEW._CommutingAllowanceCount,
				 xbter_l._CommutingAllowanceTotal = NEW._CommutingAllowanceTotal,
				 xbter_l._CommutingAllowanceSubstantiation = NEW._CommutingAllowanceSubstantiation,
				 --  
				 xbter_l._TransportationID = NEW._TransportationID,
				 xbter_l._WayAllowance = NEW._WayAllowance,
				 xbter_l._WayCount = NEW._WayCount,
				 xbter_l._WayTotal = NEW._WayTotal,
				 xbter_l._RouteDescription1 = NEW._RouteDescription1,
				 xbter_l._RouteCount1 = NEW._RouteCount1,
				 xbter_l._RouteDescription2 = NEW._RouteDescription2,
				 xbter_l._RouteCount2 = NEW._RouteCount2,
				 xbter_l._RouteDescription3 = NEW._RouteDescription3,
				 xbter_l._RouteCount3 = NEW._RouteCount3,
				 xbter_l._RouteDescription4 = NEW._RouteDescription4,
				 xbter_l._RouteCount4 = NEW._RouteCount4,
				 xbter_l._RouteDescription5 = NEW._RouteDescription5,
				 xbter_l._RouteCount5 = NEW._RouteCount5,
				 -- 
				 xbter_l._BusinesstripRemarks = NEW._BusinesstripRemarks,
				 xbter_l._BusinesstripTotal = NEW._BusinesstripTotal,
				 --  
				 xbter_l._InvoiceOrganizationID = NEW._InvoiceOrganizationID,
				 xbter_l._InvoiceCostCenter = NEW._InvoiceCostCenter,
				 --  
				 xbter_l._OwnedBy = NEW._OwnedBy,
				 xbter_l._SubmittedOn = NEW._SubmittedOn,
				 xbter_l._SubmittedRemark = NEW._SubmittedRemark,			
				 xbter_l._AcceptedByID = OLD._ModBy,
				 xbter_l._AcceptedOn = OLD._ModDate,
				 xbter_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xbter_l._ClosedOn = thecreationTime,
				 xbter_l._ClosedByID = NEW._ModBy,
				 xbter_l._ClosedRemark = NEW._ProcessStepRemark,
				 xbter_l._ModBy = NEW._ModBy,
				 xbter_l._ModDate = thecreationTime,
				 xbter_l._Deleted = 0;
						
			END IF;
		END IF;		
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//

/* xbte END */

/* xat START */
DROP TRIGGER IF EXISTS xat_beupd //
CREATE TRIGGER xat_beupd BEFORE UPDATE ON `xat` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  HotelreservationHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE FlightbookingHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE FlightbookingDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF; 
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xat_afupd //
CREATE TRIGGER xat_afupd AFTER UPDATE ON `xat` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _HelpticketIDfor PKF field !
	SELECT NEW._FlightbookingID 	
	 INTO theRecordID;
	SELECT 'xat' 	
	 INTO theModuleID;
	SELECT 'FlightbookingDecisionmaker' 	
	 INTO Decisionmakers;
	-- SELECT NEW._SupervisorID
	--  INTO Decisionmaker; 
	SELECT 'FlightbookingHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
		
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				SET Receivers = Decisionmakers;
				-- SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xatr` SET
				
				 xatr._FlightFrom1 = NEW._FlightFrom1,
				 xatr._FlightTo1 = NEW._FlightTo1,
				 xatr._FlightDepartDate1 = NEW._FlightDepartDate1,
				 xatr._FlightDepartTime1ID = NEW._FlightDepartTime1ID,
				 xatr._FlightDepartTimeRemarks1 = NEW._FlightDepartTimeRemarks1,
				 xatr._Nonstopsonly1 = NEW._Nonstopsonly1,
				 xatr._FlightFrom2 = NEW._FlightFrom2,
				 xatr._FlightTo2 = NEW._FlightTo2,
				 xatr._FlightDepartDate2 = NEW._FlightDepartDate2,
				 xatr._FlightDepartTime2ID = NEW._FlightDepartTime2ID,
				 xatr._FlightDepartTimeRemarks2 = NEW._FlightDepartTimeRemarks2,				 
				 xatr._Nonstopsonly2 = NEW._Nonstopsonly2,
				 
				 xatr._FlightClassID = NEW._FlightClassID,
				 xatr._Adulttickets = NEW._Adulttickets,
				 xatr._FlightbookingLimit = NEW._FlightbookingLimit,
				 xatr._FlightbookingRemarks = NEW._FlightbookingRemarks,
				 
				 xatr._OwnedBy = NEW._OwnedBy,	
				 xatr._SubmittedOn = NEW._SubmittedOn,
				 xatr._SubmittedRemark = NEW._SubmittedRemark,
				 
				 xatr._AcceptedByID = OLD._ModBy,
				 xatr._AcceptedOn = OLD._ModDate,
				 xatr._AcceptedRemark = OLD._ProcessStepRemark,
				 xatr._ClosedOn = thecreationTime,
				 xatr._ClosedByID = NEW._ModBy,
				 xatr._ClosedRemark = NEW._ProcessStepRemark,
				 xatr._ModBy = NEW._ModBy,
				 xatr._ModDate = thecreationTime,
				 xatr._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xatr_l` SET
				
				 xatr_l._FlightbookingID = registerRecordID,
				 
				 xatr_l._FlightFrom1 = NEW._FlightFrom1,
				 xatr_l._FlightTo1 = NEW._FlightTo1,
				 xatr_l._FlightDepartDate1 = NEW._FlightDepartDate1,
				 xatr_l._FlightDepartTime1ID = NEW._FlightDepartTime1ID,
				 xatr_l._FlightDepartTimeRemarks1 = NEW._FlightDepartTimeRemarks1,
				 xatr_l._Nonstopsonly1 = NEW._Nonstopsonly1,
				 xatr_l._FlightFrom2 = NEW._FlightFrom2,
				 xatr_l._FlightTo2 = NEW._FlightTo2,
				 xatr_l._FlightDepartDate2 = NEW._FlightDepartDate2,
				 xatr_l._FlightDepartTime2ID = NEW._FlightDepartTime2ID,
				 xatr_l._FlightDepartTimeRemarks2 = NEW._FlightDepartTimeRemarks2,				 
				 xatr_l._Nonstopsonly2 = NEW._Nonstopsonly2,
				 
				 xatr_l._FlightClassID = NEW._FlightClassID,
				 xatr_l._Adulttickets = NEW._Adulttickets,
				 xatr_l._FlightbookingLimit = NEW._FlightbookingLimit,
				 xatr_l._FlightbookingRemarks = NEW._FlightbookingRemarks,
				 
				 xatr_l._OwnedBy = NEW._OwnedBy,
				 xatr_l._SubmittedOn = NEW._SubmittedOn,
				 xatr_l._SubmittedRemark = NEW._SubmittedRemark,
				 
				 xatr_l._AcceptedByID = OLD._ModBy,
				 xatr_l._AcceptedOn = OLD._ModDate,
				 xatr_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xatr_l._ClosedOn = thecreationTime,
				 xatr_l._ClosedByID = NEW._ModBy,
				 xatr_l._ClosedRemark = NEW._ProcessStepRemark,
				 xatr_l._ModBy = NEW._ModBy,
				 xatr_l._ModDate = thecreationTime,
				 xatr_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xat END */

/* xklr  START */
DROP TRIGGER IF EXISTS xklr_beupd //
CREATE TRIGGER xklr_beupd BEFORE UPDATE ON `xklr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	--  Custom
	SELECT xkl._KittyStatusID  FROM `xkl` WHERE xkl._KittyID= NEW._KittyID AND xkl._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3014` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//


DROP TRIGGER  IF EXISTS xklr_beins //
CREATE TRIGGER xklr_beins BEFORE INSERT ON `xklr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	
	--  Custom
	SELECT xkl._KittyStatusID  FROM `xkl` WHERE xkl._KittyID = NEW._KittyID AND xkl._Deleted = 0
	 INTO statusID;
	
	-- Is the spreadsheet edition set to close
	IF statusID = 2 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3014` into dummy FROM `ntf` LIMIT 1;			
	END IF;
END;//
/* xklr  END */

/* xrc  START */
DROP TRIGGER IF EXISTS xrc_beupd //
CREATE TRIGGER xrc_beupd BEFORE UPDATE ON `xrc` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE ConferenceroomHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		-- Hanlding permisssion to change (booking only author!)
		
		--  000080
		IF NEW._Booking000080 = 0 AND OLD._Booking000080 = 1 THEN	
			IF NEW._ModBy = NEW._Person000080ID OR isAdmin OR isHandler THEN 
				SET NEW._Person000080ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking000080 = 1 AND OLD._Booking000080 = 0 THEN	
				SET NEW._Person000080ID = NEW._ModBy;		
		END IF;
		
		-- 080083
		IF NEW._Booking080083 = 0 AND OLD._Booking080083 = 1 THEN	
			IF NEW._ModBy = NEW._Person080083ID OR isAdmin OR isHandler THEN 
				SET NEW._Person080083ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking080083 = 1 AND OLD._Booking080083 = 0 THEN	
				SET NEW._Person080083ID = NEW._ModBy;		
		END IF;
		
		-- 083090
		IF NEW._Booking083090 = 0 AND OLD._Booking083090 = 1 THEN	
			IF NEW._ModBy = NEW._Person083090ID OR isAdmin OR isHandler THEN 
				SET NEW._Person083090ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking083090 = 1 AND OLD._Booking083090 = 0 THEN	
				SET NEW._Person083090ID = NEW._ModBy;		
		END IF;
		
		
		-- 090093
		IF NEW._Booking090093 = 0 AND OLD._Booking090093 = 1 THEN	
			IF NEW._ModBy = NEW._Person090093ID OR isAdmin OR isHandler THEN 
				SET NEW._Person090093ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking090093 = 1 AND OLD._Booking090093 = 0 THEN	
				SET NEW._Person090093ID = NEW._ModBy;		
		END IF;
		
		-- 093100
		IF NEW._Booking093100 = 0 AND OLD._Booking093100 = 1 THEN	
			IF NEW._ModBy = NEW._Person093100ID OR isAdmin OR isHandler THEN 
				SET NEW._Person093100ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking093100 = 1 AND OLD._Booking093100 = 0 THEN	
				SET NEW._Person093100ID = NEW._ModBy;		
		END IF;
		
		-- 110113
		IF NEW._Booking100103 = 0 AND OLD._Booking100103 = 1 THEN	
			IF NEW._ModBy = NEW._Person100103ID OR isAdmin OR isHandler THEN 
				SET NEW._Person100103ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking100103 = 1 AND OLD._Booking100103 = 0 THEN	
				SET NEW._Person100103ID = NEW._ModBy;		
		END IF;
		
		-- 103110
		IF NEW._Booking103110 = 0 AND OLD._Booking103110 = 1 THEN	
			IF NEW._ModBy = NEW._Person103110ID OR isAdmin OR isHandler THEN 
				SET NEW._Person103110ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking103110 = 1 AND OLD._Booking103110 = 0 THEN	
				SET NEW._Person103110ID = NEW._ModBy;		
		END IF;
		
		-- 110113
		IF NEW._Booking110113 = 0 AND OLD._Booking110113 = 1 THEN	
			IF NEW._ModBy = NEW._Person110113ID OR isAdmin OR isHandler THEN 
				SET NEW._Person110113ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking110113 = 1 AND OLD._Booking110113 = 0 THEN	
				SET NEW._Person110113ID = NEW._ModBy;		
		END IF;
		
		-- 113120
		IF NEW._Booking113120 = 0 AND OLD._Booking113120 = 1 THEN	
			IF NEW._ModBy = NEW._Person113120ID OR isAdmin OR isHandler THEN 
				SET NEW._Person113120ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking113120 = 1 AND OLD._Booking113120 = 0 THEN	
				SET NEW._Person113120ID = NEW._ModBy;		
		END IF;
		
		
		-- 120123
		IF NEW._Booking120123 = 0 AND OLD._Booking120123 = 1 THEN	
			IF NEW._ModBy = NEW._Person120123ID OR isAdmin OR isHandler THEN 
				SET NEW._Person120123ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking120123 = 1 AND OLD._Booking120123 = 0 THEN	
				SET NEW._Person120123ID = NEW._ModBy;		
		END IF;
		
		-- 123130
		IF NEW._Booking123130 = 0 AND OLD._Booking123130 = 1 THEN	
			IF NEW._ModBy = NEW._Person123130ID OR isAdmin OR isHandler THEN 
				SET NEW._Person123130ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking123130 = 1 AND OLD._Booking123130 = 0 THEN	
				SET NEW._Person123130ID = NEW._ModBy;		
		END IF;
		
		-- 130133
		IF NEW._Booking130133 = 0 AND OLD._Booking130133 = 1 THEN	
			IF NEW._ModBy = NEW._Person130133ID OR isAdmin OR isHandler THEN 
				SET NEW._Person130133ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking130133 = 1 AND OLD._Booking130133 = 0 THEN	
				SET NEW._Person130133ID = NEW._ModBy;		
		END IF;
		
		-- 133140
		IF NEW._Booking133140 = 0 AND OLD._Booking133140 = 1 THEN	
			IF NEW._ModBy = NEW._Person133140ID OR isAdmin OR isHandler THEN 
				SET NEW._Person133140ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking133140 = 1 AND OLD._Booking133140 = 0 THEN	
				SET NEW._Person133140ID = NEW._ModBy;		
		END IF;
		
		-- 140143
		IF NEW._Booking140143 = 0 AND OLD._Booking140143 = 1 THEN	
			IF NEW._ModBy = NEW._Person140143ID OR isAdmin OR isHandler THEN 
				SET NEW._Person140143ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking140143 = 1 AND OLD._Booking140143 = 0 THEN	
				SET NEW._Person140143ID = NEW._ModBy;		
		END IF;
		
		-- 143150
		IF NEW._Booking143150 = 0 AND OLD._Booking143150 = 1 THEN	
			IF NEW._ModBy = NEW._Person143150ID OR isAdmin OR isHandler THEN 
				SET NEW._Person143150ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking143150 = 1 AND OLD._Booking143150 = 0 THEN	
				SET NEW._Person143150ID = NEW._ModBy;		
		END IF;
		
		-- 150153
		IF NEW._Booking150153 = 0 AND OLD._Booking150153 = 1 THEN	
			IF NEW._ModBy = NEW._Person150153ID OR isAdmin OR isHandler THEN 
				SET NEW._Person150153ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking150153 = 1 AND OLD._Booking150153 = 0 THEN	
				SET NEW._Person150153ID = NEW._ModBy;		
		END IF;
		
		-- 153160
		IF NEW._Booking153160 = 0 AND OLD._Booking153160 = 1 THEN	
			IF NEW._ModBy = NEW._Person153160ID OR isAdmin OR isHandler THEN 
				SET NEW._Person153160ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking153160 = 1 AND OLD._Booking153160 = 0 THEN	
				SET NEW._Person153160ID = NEW._ModBy;		
		END IF;
		
		-- 160163
		IF NEW._Booking160163 = 0 AND OLD._Booking160163 = 1 THEN	
			IF NEW._ModBy = NEW._Person160163ID OR isAdmin OR isHandler THEN 
				SET NEW._Person160163ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking160163 = 1 AND OLD._Booking160163 = 0 THEN	
				SET NEW._Person160163ID = NEW._ModBy;		
		END IF;
		
		-- 163170
		IF NEW._Booking163170 = 0 AND OLD._Booking163170 = 1 THEN	
			IF NEW._ModBy = NEW._Person163170ID OR isAdmin OR isHandler THEN 
				SET NEW._Person163170ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking163170 = 1 AND OLD._Booking163170 = 0 THEN	
				SET NEW._Person163170ID = NEW._ModBy;		
		END IF;
		
		-- 170240
		IF NEW._Booking170240 = 0  AND OLD._Booking170240 = 1 THEN	
			IF NEW._ModBy = NEW._Person170240ID OR isAdmin OR isHandler THEN 
				SET NEW._Person170240ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking170240 = 1 AND OLD._Booking170240 = 0 THEN	
				SET NEW._Person170240ID = NEW._ModBy;		
		END IF;
		
	END IF;
END;//
/* xrc  END */

/* xr  START */
DROP PROCEDURE IF EXISTS xr_fill_xrc //
CREATE PROCEDURE xr_fill_xrc( days_ahead INT )
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE start_date DATE;
	DECLARE end_date DATE;
	DECLARE crt_date DATE;
	DECLARE resourceID INT;
	
	-- Custom
	DECLARE csr1 CURSOR FOR SELECT _RoomID FROM xr WHERE _Deleted = 0;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	
	SET start_date = CURDATE();
	SET end_date = DATE_ADD(start_date, interval days_ahead day);	
	OPEN csr1;
	resource_loop: LOOP 
		FETCH csr1 INTO resourceID;
		
		IF done =1 THEN 
			LEAVE resource_loop;
		END IF;
		
		SET crt_date = start_date;
		WHILE crt_date < end_date DO
			-- Custom
			INSERT INTO xrc ( _BookingDate, _RoomID ) VALUES ( crt_date, resourceID) 
			 ON DUPLICATE KEY UPDATE _RoomID = _RoomID;
			SET crt_date = ADDDATE( crt_date, INTERVAL 1 DAY );
		END WHILE;
		
	END LOOP resource_loop;
	CLOSE csr1;
END;//
/* xr  END */

/* xmrc  START */
DROP TRIGGER IF EXISTS xmrc_beupd //
CREATE TRIGGER xmrc_beupd BEFORE UPDATE ON `xmrc` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE ConferenceresourceHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		-- Hanlding permisssion to change (booking only author!)
		
		--  000080
		IF NEW._Booking000080 = 0 AND OLD._Booking000080 = 1 THEN	
			IF NEW._ModBy = NEW._Person000080ID OR isAdmin OR isHandler THEN 
				SET NEW._Person000080ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking000080 = 1 AND OLD._Booking000080 = 0 THEN	
				SET NEW._Person000080ID = NEW._ModBy;		
		END IF;
		
		-- 080083
		IF NEW._Booking080083 = 0 AND OLD._Booking080083 = 1 THEN	
			IF NEW._ModBy = NEW._Person080083ID OR isAdmin OR isHandler THEN 
				SET NEW._Person080083ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking080083 = 1 AND OLD._Booking080083 = 0 THEN	
				SET NEW._Person080083ID = NEW._ModBy;		
		END IF;
		
		-- 083090
		IF NEW._Booking083090 = 0 AND OLD._Booking083090 = 1 THEN	
			IF NEW._ModBy = NEW._Person083090ID OR isAdmin OR isHandler THEN 
				SET NEW._Person083090ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking083090 = 1 AND OLD._Booking083090 = 0 THEN	
				SET NEW._Person083090ID = NEW._ModBy;		
		END IF;
		
		
		-- 090093
		IF NEW._Booking090093 = 0 AND OLD._Booking090093 = 1 THEN	
			IF NEW._ModBy = NEW._Person090093ID OR isAdmin OR isHandler THEN 
				SET NEW._Person090093ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking090093 = 1 AND OLD._Booking090093 = 0 THEN	
				SET NEW._Person090093ID = NEW._ModBy;		
		END IF;
		
		-- 093100
		IF NEW._Booking093100 = 0 AND OLD._Booking093100 = 1 THEN	
			IF NEW._ModBy = NEW._Person093100ID OR isAdmin OR isHandler THEN 
				SET NEW._Person093100ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking093100 = 1 AND OLD._Booking093100 = 0 THEN	
				SET NEW._Person093100ID = NEW._ModBy;		
		END IF;
		
		-- 110113
		IF NEW._Booking100103 = 0 AND OLD._Booking100103 = 1 THEN	
			IF NEW._ModBy = NEW._Person100103ID OR isAdmin OR isHandler THEN 
				SET NEW._Person100103ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking100103 = 1 AND OLD._Booking100103 = 0 THEN	
				SET NEW._Person100103ID = NEW._ModBy;		
		END IF;
		
		-- 103110
		IF NEW._Booking103110 = 0 AND OLD._Booking103110 = 1 THEN	
			IF NEW._ModBy = NEW._Person103110ID OR isAdmin OR isHandler THEN 
				SET NEW._Person103110ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking103110 = 1 AND OLD._Booking103110 = 0 THEN	
				SET NEW._Person103110ID = NEW._ModBy;		
		END IF;
		
		-- 110113
		IF NEW._Booking110113 = 0 AND OLD._Booking110113 = 1 THEN	
			IF NEW._ModBy = NEW._Person110113ID OR isAdmin OR isHandler THEN 
				SET NEW._Person110113ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking110113 = 1 AND OLD._Booking110113 = 0 THEN	
				SET NEW._Person110113ID = NEW._ModBy;		
		END IF;
		
		-- 113120
		IF NEW._Booking113120 = 0 AND OLD._Booking113120 = 1 THEN	
			IF NEW._ModBy = NEW._Person113120ID OR isAdmin OR isHandler THEN 
				SET NEW._Person113120ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking113120 = 1 AND OLD._Booking113120 = 0 THEN	
				SET NEW._Person113120ID = NEW._ModBy;		
		END IF;
		
		
		-- 120123
		IF NEW._Booking120123 = 0 AND OLD._Booking120123 = 1 THEN	
			IF NEW._ModBy = NEW._Person120123ID OR isAdmin OR isHandler THEN 
				SET NEW._Person120123ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking120123 = 1 AND OLD._Booking120123 = 0 THEN	
				SET NEW._Person120123ID = NEW._ModBy;		
		END IF;
		
		-- 123130
		IF NEW._Booking123130 = 0 AND OLD._Booking123130 = 1 THEN	
			IF NEW._ModBy = NEW._Person123130ID OR isAdmin OR isHandler THEN 
				SET NEW._Person123130ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking123130 = 1 AND OLD._Booking123130 = 0 THEN	
				SET NEW._Person123130ID = NEW._ModBy;		
		END IF;
		
		-- 130133
		IF NEW._Booking130133 = 0 AND OLD._Booking130133 = 1 THEN	
			IF NEW._ModBy = NEW._Person130133ID OR isAdmin OR isHandler THEN 
				SET NEW._Person130133ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking130133 = 1 AND OLD._Booking130133 = 0 THEN	
				SET NEW._Person130133ID = NEW._ModBy;		
		END IF;
		
		-- 133140
		IF NEW._Booking133140 = 0 AND OLD._Booking133140 = 1 THEN	
			IF NEW._ModBy = NEW._Person133140ID OR isAdmin OR isHandler THEN 
				SET NEW._Person133140ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking133140 = 1 AND OLD._Booking133140 = 0 THEN	
				SET NEW._Person133140ID = NEW._ModBy;		
		END IF;
		
		-- 140143
		IF NEW._Booking140143 = 0 AND OLD._Booking140143 = 1 THEN	
			IF NEW._ModBy = NEW._Person140143ID OR isAdmin OR isHandler THEN 
				SET NEW._Person140143ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking140143 = 1 AND OLD._Booking140143 = 0 THEN	
				SET NEW._Person140143ID = NEW._ModBy;		
		END IF;
		
		-- 143150
		IF NEW._Booking143150 = 0 AND OLD._Booking143150 = 1 THEN	
			IF NEW._ModBy = NEW._Person143150ID OR isAdmin OR isHandler THEN 
				SET NEW._Person143150ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking143150 = 1 AND OLD._Booking143150 = 0 THEN	
				SET NEW._Person143150ID = NEW._ModBy;		
		END IF;
		
		-- 150153
		IF NEW._Booking150153 = 0 AND OLD._Booking150153 = 1 THEN	
			IF NEW._ModBy = NEW._Person150153ID OR isAdmin OR isHandler THEN 
				SET NEW._Person150153ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking150153 = 1 AND OLD._Booking150153 = 0 THEN	
				SET NEW._Person150153ID = NEW._ModBy;		
		END IF;
		
		-- 153160
		IF NEW._Booking153160 = 0 AND OLD._Booking153160 = 1 THEN	
			IF NEW._ModBy = NEW._Person153160ID OR isAdmin OR isHandler THEN 
				SET NEW._Person153160ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking153160 = 1 AND OLD._Booking153160 = 0 THEN	
				SET NEW._Person153160ID = NEW._ModBy;		
		END IF;
		
		-- 160163
		IF NEW._Booking160163 = 0 AND OLD._Booking160163 = 1 THEN	
			IF NEW._ModBy = NEW._Person160163ID OR isAdmin OR isHandler THEN 
				SET NEW._Person160163ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking160163 = 1 AND OLD._Booking160163 = 0 THEN	
				SET NEW._Person160163ID = NEW._ModBy;		
		END IF;
		
		-- 163170
		IF NEW._Booking163170 = 0 AND OLD._Booking163170 = 1 THEN	
			IF NEW._ModBy = NEW._Person163170ID OR isAdmin OR isHandler THEN 
				SET NEW._Person163170ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking163170 = 1 AND OLD._Booking163170 = 0 THEN	
				SET NEW._Person163170ID = NEW._ModBy;		
		END IF;
		
		-- 170240
		IF NEW._Booking170240 = 0  AND OLD._Booking170240 = 1 THEN	
			IF NEW._ModBy = NEW._Person170240ID OR isAdmin OR isHandler THEN 
				SET NEW._Person170240ID = NULL;
			ELSE
				--  "You have no permissions to make this action for this case!"
				SELECT `error_3015` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF;
		IF NEW._Booking170240 = 1 AND OLD._Booking170240 = 0 THEN	
				SET NEW._Person170240ID = NEW._ModBy;		
		END IF;
		
	END IF;
END;//
/* xmrc  END */

/* xmr  START */
DROP PROCEDURE IF EXISTS xmr_fill_xmrc //
CREATE PROCEDURE xmr_fill_xmrc( days_ahead INT )
BEGIN
	DECLARE done INT DEFAULT 0;
	DECLARE start_date DATE;
	DECLARE end_date DATE;
	DECLARE crt_date DATE;
	DECLARE resourceID INT;
	
	-- Custom
	DECLARE csr1 CURSOR FOR SELECT _ResourceID FROM xmr WHERE _Deleted = 0;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	
	SET start_date = CURDATE();
	SET end_date = DATE_ADD(start_date, interval days_ahead day);	
	OPEN csr1;
	resource_loop: LOOP 
		FETCH csr1 INTO resourceID;
		
		IF done =1 THEN 
			LEAVE resource_loop;
		END IF;
		
		SET crt_date = start_date;
		WHILE crt_date < end_date DO
			-- Custom
			INSERT INTO xmrc ( _BookingDate, _ResourceID ) VALUES ( crt_date, resourceID) 
			 ON DUPLICATE KEY UPDATE _ResourceID = _ResourceID;
			SET crt_date = ADDDATE( crt_date, INTERVAL 1 DAY );
		END WHILE;
		
	END LOOP resource_loop;
	CLOSE csr1;
END;//
/* xmr  END */

/* xts START */
DROP TRIGGER IF EXISTS xts_beupd //
CREATE TRIGGER xts_beupd BEFORE UPDATE ON `xts` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	DECLARE nullWorkEndcount INT;
	DECLARE xtsrRowCount INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  HotelreservationHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE TimesheetHandler = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE TimesheetDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				
				-- Custom
				SELECT count(*) FROM xtsr WHERE xtsr._Deleted = 0 
				 AND xtsr._TimesheetID = NEW._TimesheetID AND xtsr._WorkEnd IS NULL 
				 INTO  nullWorkEndcount;				
				IF nullWorkEndcount >0 THEN 
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3026` into dummy FROM `ntf` LIMIT 1;
				END IF;
				
				SELECT count(*) FROM xtsr WHERE xtsr._Deleted = 0 
				 AND xtsr._TimesheetID = NEW._TimesheetID  
				 INTO  xtsrRowCount;
				IF xtsrRowCount = 0 THEN 
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3027` into dummy FROM `ntf` LIMIT 1;
				END IF;
				
				-- only case owner can submit				
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;					
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF; 
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xts_afupd //
CREATE TRIGGER xts_afupd AFTER UPDATE ON `xts` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _HelpticketIDfor PKF field !
	SELECT NEW._TimesheetID 	
	 INTO theRecordID;
	SELECT 'xts' 	
	 INTO theModuleID;
	-- SELECT 'HelpdeskDecisionmaker' 	
	-- INTO Decisionmakers;
	SELECT NEW._SupervisorID
	 INTO Decisionmaker; 
	SELECT 'TimesheetHandler' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
		
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				-- SET Receivers = Decisionmakers;
				SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT INTO  xtsrr (  _WorkDate, _WorkStart, _WorkEnd, _OwnedBy, _TimesheetID, _WorkPeriodStart, _WorkPeriodEnd,
				 _SubmittedOn, _SubmittedRemark,
				 _AcceptedByID, _AcceptedOn, _AcceptedRemark, 
				 _ClosedOn,  _ClosedByID, _ClosedRemark,
				 _ModBy, _ModDate, _Deleted)  
				 SELECT     
				 xtsr._WorkDate, xtsr._WorkStart, xtsr._WorkEnd, xtsr._OwnedBy, xtsr._TimesheetID, NEW._WorkPeriodStart, NEW._WorkPeriodEnd,
				 NEW._SubmittedOn, NEW._SubmittedRemark,
				 OLD._ModBy, OLD._ModDate, OLD._ProcessStepRemark,
				 thecreationTime, NEW._ModBy, NEW._ProcessStepRemark,
				 NEW._ModBy, thecreationTime, 0
				FROM  xtsr  WHERE xtsr._TimesheetID = theRecordID AND xtsr._Deleted = 0; 
				
				INSERT INTO  xtsrr_l (  _WorkDate, _WorkStart, _WorkEnd, _OwnedBy, _TimesheetID, _TimesheetRowID, _WorkPeriodStart, _WorkPeriodEnd,
				 _SubmittedOn, _SubmittedRemark,
				 _AcceptedByID, _AcceptedOn, _AcceptedRemark, 
				 _ClosedOn,  _ClosedByID, _ClosedRemark,
				 _ModBy, _ModDate, _Deleted)  
				 SELECT     
				 xtsrr._WorkDate, xtsrr._WorkStart, xtsrr._WorkEnd, xtsrr._OwnedBy, xtsrr._TimesheetID, xtsrr._TimesheetRowID, NEW._WorkPeriodStart, NEW._WorkPeriodEnd,
				 NEW._SubmittedOn, NEW._SubmittedRemark,
				 OLD._ModBy, OLD._ModDate, OLD._ProcessStepRemark,
				 thecreationTime, NEW._ModBy, NEW._ProcessStepRemark,
				 NEW._ModBy, thecreationTime, 0
				FROM  xtsrr  WHERE xtsrr._TimesheetID = theRecordID AND xtsrr._Deleted = 0; 
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;

			UPDATE `xtsr` SET xtsr._Deleted = 1 WHERE 
			xtsr._TimesheetID = theRecordID;
	END IF;
END;// 
/* xts END */

/* xtsr START */
DROP TRIGGER IF EXISTS xtsr_beins //
CREATE TRIGGER xtsr_beins BEFORE INSERT ON `xtsr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	DECLARE OwnerID INT;
	
	-- Rows can be added only if status is nocall
	SELECT xts._ProcessStateID  FROM `xts` WHERE xts._TimesheetID = NEW._TimesheetID AND xts._Deleted = 0
	 INTO statusID;	
	 
	IF statusID != 1 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3025` into dummy FROM `ntf` LIMIT 1;			
	END IF;
	
	-- Workaround for not being able to pass _OwnedBy
	SELECT xts._OwnedBy  FROM `xts` WHERE xts._TimesheetID = NEW._TimesheetID AND xts._Deleted = 0
	 INTO OwnerID;
	SET NEW._OwnedBy = OwnerID;
	
	-- Workaround for validation in the module definiotion
	IF !ISNULL( NEW._WorkStart ) AND !ISNULL( NEW._WorkEnd ) THEN 
		IF NEW._WorkEnd >= NEW._WorkStart THEN
			SET NEW._WorkTimeSec = TIME_TO_SEC( NEW._WorkEnd ) - TIME_TO_SEC( NEW._WorkStart );
		ELSE 
			-- "You have no permissions to make this action for this case!"
			SELECT `error_3023` into dummy FROM `ntf` LIMIT 1;
		END IF;
	END IF;
	IF ISNULL( NEW._WorkEnd ) THEN
		SET NEW._WorkTimeSec = NULL;
	END IF;
END;//

DROP TRIGGER IF EXISTS xtsr_beupd //
CREATE TRIGGER xtsr_beupd BEFORE UPDATE ON `xtsr` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE statusID INT;
	DECLARE OwnerID INT;
	
	SELECT xts._ProcessStateID  FROM `xts` WHERE xts._TimesheetID = NEW._TimesheetID AND xts._Deleted = 0
	 INTO statusID;	
	
	IF statusID != 1 THEN			
		-- "You have no permissions to make this action for this case!"
		SELECT `error_3025` into dummy FROM `ntf` LIMIT 1;			
	END IF;
	
	-- Workaround for validation in the module definiotion
	IF !ISNULL( NEW._WorkStart ) AND !ISNULL( NEW._WorkEnd ) THEN 
		IF NEW._WorkEnd >= NEW._WorkStart THEN
			SET NEW._WorkTimeSec = TIME_TO_SEC( NEW._WorkEnd ) - TIME_TO_SEC( NEW._WorkStart );
		ELSE 
			-- "You have no permissions to make this action for this case!"
			SELECT `error_3023` into dummy FROM `ntf` LIMIT 1;
		END IF;
	END IF;
	IF ISNULL( NEW._WorkEnd ) THEN
		SET NEW._WorkTimeSec = NULL;
	END IF;	
END;//
/* xtsr END */

DROP PROCEDURE IF EXISTS every_day_jobs //
CREATE PROCEDURE every_day_jobs()
BEGIN
	-- xrc ( Conference room calendar )
	-- UPDATE xrc, xrcc SET xrcc._Deleted = 1 
	-- WHERE xrcc._RoomDayID = xrc._RoomDayID  AND xrc._BookingDate < CURDATE() AND xrcc._Deleted = 0;
	DELETE xrcc FROM xrcc, xrc 
	 WHERE xrcc._RoomDayID = xrc._RoomDayID  AND xrc._BookingDate < SUBDATE( CURDATE(), INTERVAL 180 DAY );	
	DELETE FROM xrc WHERE xrc._BookingDate < SUBDATE( CURDATE(), INTERVAL 180 DAY );
	UPDATE xrc SET xrc._Deleted = 1 WHERE xrc._BookingDate < CURDATE() AND xrc._Deleted = 0;	
	CALL xr_fill_xrc( 90 );
	
	-- xmrc ( Conference resource calendar )
	DELETE FROM xmrc WHERE xmrc._BookingDate < SUBDATE( CURDATE(), INTERVAL 180 DAY );		
	UPDATE xmrc SET xmrc._Deleted = 1 WHERE xmrc._BookingDate < CURDATE() AND xmrc._Deleted = 0;
	CALL xmr_fill_xmrc( 90 );
END;//
	
DROP EVENT IF EXISTS every_day //
CREATE EVENT every_day ON SCHEDULE  EVERY 1 HOUR DO 
BEGIN
    CALL every_day_jobs();
END;//

DROP PROCEDURE IF EXISTS group_membership_mgm //
CREATE PROCEDURE group_membership_mgm( 
 old_acteur_state INT, new_acteur_state INT, group_handle varchar(5), personID INT, modBy INT, modDate DATE
)
BEGIN

	DECLARE groupID INT;
	DECLARE memberID INT;
	DECLARE recordDeleted INT;
	DECLARE membershipCounter INT;
	
	-- workflow module  meber group
	IF ( old_acteur_state = 0 AND new_acteur_state = 1 ) THEN
				
		SELECT usrg.UserGroupID INTO groupID 
		FROM usrg WHERE usrg.SQLGroupHandle = group_handle AND usrg._Deleted = 0 LIMIT 1;
		
		SELECT usrgm.MembershipID, usrgm._Deleted, usrgm.MembershipCounter 
		 INTO memberID, recordDeleted, membershipCounter
		 FROM usrgm WHERE usrgm.UserGroupID = groupID AND usrgm.PersonID = personID LIMIT 1;
		
		SET membershipCounter = membershipCounter + 1;		
		IF memberID > 0 THEN				
			UPDATE usrgm SET usrgm.MembershipCounter = membershipCounter, usrgm._Deleted = 0
			 WHERE usrgm.MembershipID = memberID;
		END IF;
		IF memberID IS NULL THEN 
			INSERT INTO  usrgm( PersonID, UserGroupID, _ModBy, _ModDate, _Deleted, MembershipCounter ) 
			 VALUES (personID, groupID, modBy, modDate, 0, 1);
		END IF;
		
	END IF;
	
	IF ( old_acteur_state  = 1 AND new_acteur_state  = 0 ) THEN
			
		SELECT usrg.UserGroupID INTO groupID 
		FROM usrg WHERE usrg.SQLGroupHandle = group_handle AND usrg._Deleted = 0 LIMIT 1;
		
		SELECT usrgm.MembershipID, usrgm._Deleted, usrgm.MembershipCounter 
		 INTO memberID, recordDeleted, membershipCounter 
		 FROM usrgm WHERE usrgm.UserGroupID = groupID AND usrgm.PersonID = personID LIMIT 1;		
		
		SET membershipCounter = membershipCounter - 1;
		IF memberID > 0 THEN 
			IF membershipCounter > 0 THEN
				UPDATE usrgm SET usrgm.MembershipCounter = membershipCounter 
				 WHERE usrgm.MembershipID = memberID;	
			ELSE
				UPDATE usrgm SET usrgm.MembershipCounter = membershipCounter, usrgm._Deleted = 1 
				 WHERE usrgm.MembershipID = memberID;
			END IF;			
		END IF;	
		
	END IF;
	
END;//

DROP PROCEDURE IF EXISTS mfn_membership_mgm //
CREATE PROCEDURE mfn_membership_mgm( 
 old_acteur_state INT, new_acteur_state INT, rollesSum INT, personID INT, modBy INT, modDate DATE
)
BEGIN

	DECLARE groupID INT;
	DECLARE memberID INT;
	DECLARE recordDeleted INT;
	
	IF ( old_acteur_state = 0 AND new_acteur_state = 1 ) THEN
				-- workflow module  meber group
		SELECT usrg.UserGroupID INTO groupID 
		FROM usrg WHERE usrg.SQLGroupHandle = 'mfn' AND usrg._Deleted = 0 LIMIT 1;
		
		SELECT usrgm.MembershipID, usrgm._Deleted INTO memberID, recordDeleted
		 FROM usrgm WHERE usrgm.UserGroupID = groupID AND usrgm.PersonID = personID LIMIT 1;
		
		IF memberID > 0 AND recordDeleted = 1 THEN 
			UPDATE usrgm SET usrgm._Deleted = 0 WHERE usrgm.MembershipID = memberID;	
		END IF;
		IF memberID IS NULL THEN 
			INSERT INTO  usrgm( PersonID, UserGroupID, _ModBy, _ModDate, _Deleted ) 
			 VALUES (personID, groupID, modBy, modDate, 0);
		END IF;
		
	END IF;
	
	IF ( old_acteur_state  = 1 AND new_acteur_state  = 0 ) THEN
			
		IF rollesSum IS NULL THEN
			
			SELECT usrg.UserGroupID INTO groupID 
			 FROM usrg WHERE usrg.SQLGroupHandle = 'mfn' AND usrg._Deleted = 0 LIMIT 1;
		
			SELECT usrgm.MembershipID, usrgm._Deleted INTO memberID, recordDeleted
			 FROM usrgm WHERE usrgm.UserGroupID = GroupID AND usrgm.PersonID = personID LIMIT 1;
			
			IF memberID > 0 AND recordDeleted = 0 THEN 
				UPDATE usrgm SET usrgm._Deleted = 1 WHERE usrgm.MembershipID = memberID;	
			END IF;	
				
		END IF;	
	END IF;
END;//

DROP PROCEDURE IF EXISTS poweruser_mgm //
CREATE PROCEDURE poweruser_mgm( 
 old_acteur_state INT, new_acteur_state INT, moduleID varchar(5), personID INT, modBy INT, modDate DATE
)
BEGIN

	DECLARE poweruserID INT;
	
	IF ( old_acteur_state = 0 AND new_acteur_state = 1 ) THEN
		
		SELECT PoweruserID INTO poweruserID FROM pu 
			 WHERE pu.PersonID = personID AND RelatedModuleID = moduleID AND pu._Deleted = 0 LIMIT 1;
		IF poweruserID IS NULL THEN 
			INSERT INTO  pu( PersonID, RelatedModuleID, SupportsData, SupportsOperation, SupportsFaults, _ModBy, _ModDate, _Deleted ) 
			 VALUES (personID, moduleID, 1, 1, 1, modBy, modDate, 0);
		END IF;
		
	END IF;

	IF ( old_acteur_state  = 1 AND new_acteur_state  = 0 ) THEN
	
		UPDATE pu SET pu._Deleted = 1 
		 WHERE pu.PersonID = personID AND RelatedModuleID = moduleID AND pu._Deleted = 0;
			 
	END IF;
END;//


DROP PROCEDURE IF EXISTS assign_register_handler //
CREATE PROCEDURE assign_register_handler( 
 theRecordID INT, theModuleID varchar(5), AfterHandlers varchar(128), theRecordDescription text, modBy INT
)
BEGIN
	
	DECLARE thecreationTime datetime;
	DECLARE ntfRecordID INT;
	
	SELECT NOW()	
	 INTO thecreationTime; 
	
	INSERT `ntf` SET 
			 ntf.SendFlag = 1,
			 ntf.Receivers = AfterHandlers,
			 ntf.MessageTemplate = 1,			 
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf.ProcessStateID = 10,
			 ntf._ModBy = modBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
	SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
	INSERT `ntf_l` SET	
			 ntf_l.SendFlag = 1,
			 ntf_l.Receivers = AfterHandlers,
			 ntf_l.MessageTemplate = 1,			 
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l.ProcessStateID = 10,
			 ntf_l._ModBy = modBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID; 
	
	INSERT `rdc` SET 					 
			 rdc.RecordID = theRecordID,
			 rdc.ModuleID = theModuleID,
			 rdc.Value =  theRecordDescription,
			 rdc._ModBy = modBy,
			 rdc._ModDate = thecreationTime,
			 rdc._Deleted = 0;
END;//

/* xes START */
DROP TRIGGER IF EXISTS xes_beupd //
CREATE TRIGGER xes_beupd BEFORE UPDATE ON `xes` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	
    -- Rolles	
	DECLARE isOwner INT;
	DECLARE isDecisionmaker INT;	
	DECLARE isHandler INT;
	DECLARE isAdmin INT;
	
	--  User is in the rolle? 
	SELECT NEW._ModBy IN 
	( SELECT ppl.PersonID FROM `ppl`,`usr` WHERE usr._Deleted = 0 AND ppl._Deleted = 0
     AND ppl.PersonID = usr.PersonID AND ppl.PersonStatusID = 1 AND usr.isAdmin = 1 )
	 INTO isAdmin;
	 
	-- CUSTOM: 
	--  HotelreservationHandler swaped
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE ExpenseApprover = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isHandler;
	--  Implementation as isHandler
	SELECT NEW._ModBy IN 
	( SELECT PersonID FROM `ppl` WHERE ExpenseDecisionmaker = 1 AND _Deleted = 0 AND PersonStatusID = 1 )
	 INTO isDecisionmaker;
	SELECT NEW._ModBy = NEW._OwnedBy	
	 INTO isOwner;
	 
	-- ======= --
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 1 ) THEN
		IF OLD._ProcessStateID IN (1,2,4,5,6) THEN
			IF NOT( isOwner OR isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;
		IF OLD._ProcessStateID IN (3) THEN
			IF NOT( isAdmin ) THEN				
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
			END IF;
		END IF;		
	END IF; 
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
	
		IF IsNull( OLD._beupdActionFlag )  AND IsNull( NEW._beupdActionFlag ) THEN
			IF OLD._ProcessStateID IN (1) THEN
				IF NOT( isOwner OR isAdmin ) THEN				
					-- "You have no permissions to make this action for this case!"
					SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;				
				END IF;
			END IF;
		END IF;
		
		SET NEW._afupdActionFlag = NULL;
		IF NEW._beupdActionFlag = 1 THEN 
		
			SET NEW._beupdActionFlag = NULL;
			SET NEW._afupdActionFlag = 1;
			
			-- if unsubmitted, submit
			IF OLD._ProcessStateID = 1 AND NEW._NextProcessStateID = 2 THEN
				-- only case owner can submit
				IF isOwner OR isAdmin THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 3;
					SET nextprocessState = 3;
					SET	NEW._SubmittedOn = NOW();
					SET NEW._SubmittedRemark = NEW._NextProcessStepRemark;
				END IF;
			END IF;
			
			-- if submited, accept or reject
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 3 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 4;
					SET nextprocessState = 5;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 2 AND NEW._NextProcessStateID = 4 THEN
				-- only supervisor can accept or reject
				IF isDecisionmaker OR isAdmin THEN	
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			
			-- if accepted, close by the case handler
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 5 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 3 AND NEW._NextProcessStateID = 6 THEN
				IF isHandler  OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 1;
					SET nextprocessState = 1;	
				END IF;
			END IF;
			
			-- if rejected,  unsubmited
			IF OLD._ProcessStateID = 4 AND NEW._NextProcessStateID = 1  THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN				
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- if closed, unsubmited
			IF OLD._ProcessStateID = 5 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			IF OLD._ProcessStateID = 6 AND NEW._NextProcessStateID = 1 THEN
				-- only case owner can reopen (unsubmit)
				IF isOwner OR isAdmin  THEN
					SET changeState = 1;
					SET NEW._NextProcessStep = 2;
					SET nextprocessState = 2;	
				END IF;
			END IF;
			
			-- Decison handling
			IF changeState = 1 THEN			
				SET NEW._ProcessStateID = NEW._NextProcessStateID;
				SET NEW._ProcessStepRemark = NEW._NextProcessStepRemark;
				SET NEW._NextProcessStepRemark = NULL;
				SET NEW._NextProcessStateID = nextprocessState;
				SET NEW._ActiontakerID = NEW._ModBy;
			ELSE
				-- "You have no permissions to make this action for this case!"
				SELECT `error_3003` into dummy FROM `ntf` LIMIT 1;
			END IF;
		END IF; 
	END IF; 
END;//
 

DROP TRIGGER IF EXISTS xes_afupd //
CREATE TRIGGER xes_afupd AFTER UPDATE ON `xes` FOR EACH ROW
BEGIN
	-- Needed by workaround for missing msg in MySQL
	DECLARE dummy INT;
	
	-- For better program structure
	DECLARE thecreationTime datetime;
	DECLARE changeState INT;
	DECLARE nextprocessState INT;	 
	DECLARE theRecordID INT;
	DECLARE theModuleID varchar(5);
	DECLARE ntfRecordID INT;
	DECLARE registerRecordID INT;
	DECLARE sendFlag INT;	
	DECLARE Receiver INT;
	DECLARE Receivers varchar(128);	
	DECLARE Decisionmakers varchar(128);
	DECLARE Decisionmaker INT;
	DECLARE Handlers varchar(128);
	
	SELECT NOW()	
	 INTO thecreationTime;
	 
	-- CUSTOM: 
	-- swap  _HelpticketIDfor PKF field !
	SELECT NEW._ExpenseID 	
	 INTO theRecordID;
	SELECT 'xes' 	
	 INTO theModuleID;
	-- SELECT 'HelpdeskDecisionmaker' 	
	-- INTO Decisionmakers;
	SELECT NEW._SupervisorID
	 INTO Decisionmaker; 
	SELECT 'ExpenseApprover' 	
	 INTO Handlers;
	
	
	IF ( OLD._Deleted = 0 AND NEW._Deleted = 0 ) THEN
		
		IF NEW._afupdActionFlag = 1 THEN
		
			IF NEW._ProcessStateID = 2 THEN		
				SET sendFlag = 1;
				-- SET Receivers = Decisionmakers;
				SET Receiver = Decisionmaker;			
			END IF;
			
			IF NEW._ProcessStateID = 3 THEN		
				SET sendFlag = 1;
				SET Receivers = Handlers;			
			END IF;
			
			IF NEW._ProcessStateID = 4 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			IF NEW._ProcessStateID = 5 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;		
			END IF;
			
			IF NEW._ProcessStateID = 6 THEN
				SET sendFlag = 1;
				SET Receiver = NEW._OwnedBy;			
			END IF;
			
			-- additing to ntf for email meesaging and case history
			INSERT `ntf` SET 
			 ntf.SendFlag = sendFlag,
			 ntf.Receiver = Receiver,
			 ntf.Receivers = Receivers,			
			 ntf.OldProcessStateID = OLD._ProcessStateID, 
			 ntf.ProcessStateID = NEW._ProcessStateID,
			 ntf.Remark = NEW._ProcessStepRemark,
			 ntf.RelatedRecordID = theRecordID,
			 ntf.RelatedModuleID = theModuleID,
			 ntf._ModBy = NEW._ModBy,
			 ntf._ModDate = thecreationTime,
			 ntf._Deleted = 0;
			
			SELECT LAST_INSERT_ID() INTO ntfRecordID;
			
			INSERT `ntf_l` SET	
			 ntf_l.SendFlag = sendFlag,
			 ntf_l.Receiver = Receiver,
			 ntf_l.Receivers = Receivers,			
			 ntf_l.OldProcessStateID = OLD._ProcessStateID, 
			 ntf_l.ProcessStateID = NEW._ProcessStateID,
			 ntf_l.Remark = NEW._ProcessStepRemark,
			 ntf_l.RelatedRecordID = theRecordID,
			 ntf_l.RelatedModuleID = theModuleID,
			 ntf_l._ModBy = NEW._ModBy,
			 ntf_l._ModDate = thecreationTime,
			 ntf_l._Deleted = 0,
			 ntf_l.NotificationID = ntfRecordID;
			
			-- Custom entry into the case register if case closed
			IF NEW._ProcessStateID = 5 THEN
				INSERT `xesr` SET
				
				 xesr._ExpenseSubject = NEW._ExpenseSubject,
				 xesr._ExpenseDescription = NEW._ExpenseDescription,
				 xesr._ExpenseTotal = NEW._ExpenseTotal,
				 
				 xesr._OwnedBy = NEW._OwnedBy,
				 xesr._SubmittedOn = NEW._SubmittedOn,
				 xesr._SubmittedRemark = NEW._SubmittedRemark,				 
				 xesr._AcceptedByID = OLD._ModBy,
				 xesr._AcceptedOn = OLD._ModDate,
				 xesr._AcceptedRemark = OLD._ProcessStepRemark,
				 xesr._ClosedOn = thecreationTime,
				 xesr._ClosedByID = NEW._ModBy,
				 xesr._ClosedRemark = NEW._ProcessStepRemark,
				 xesr._ModBy = NEW._ModBy,
				 xesr._ModDate = thecreationTime,
				 xesr._Deleted = 0;
			
				SELECT LAST_INSERT_ID() INTO registerRecordID;
			
				INSERT `xesr_l` SET
				
				 xesr_l._ExpenseID = registerRecordID,
				 
				 xesr_l._ExpenseSubject = NEW._ExpenseSubject,
				 xesr_l._ExpenseDescription = NEW._ExpenseDescription,
				 xesr_l._ExpenseTotal = NEW._ExpenseTotal,
				 
				 xesr_l._OwnedBy = NEW._OwnedBy,
				 xesr_l._SubmittedOn = NEW._SubmittedOn,
				 xesr_l._SubmittedRemark = NEW._SubmittedRemark,
				 xesr_l._AcceptedByID = OLD._ModBy,
				 xesr_l._AcceptedOn = OLD._ModDate,
				 xesr_l._AcceptedRemark = OLD._ProcessStepRemark,
				 xesr_l._ClosedOn = thecreationTime,
				 xesr_l._ClosedByID = NEW._ModBy,
				 xesr_l._ClosedRemark = NEW._ProcessStepRemark,
				 xesr_l._ModBy = NEW._ModBy,
				 xesr_l._ModDate = thecreationTime,
				 xesr_l._Deleted = 0;
						
			END IF;
		END IF;
	END IF;
	
	-- if delete action -> replacing dropped xxx_afupd
	IF( OLD._Deleted = 0 AND NEW._Deleted = 1 )  THEN
			UPDATE `rmd` SET rmd._Deleted = 1 WHERE 
			rmd.RelatedModuleID = theModuleID AND rmd.RelatedRecordID = theRecordID;
			UPDATE `att` SET att._Deleted = 1 WHERE 
			att.RelatedModuleID = theModuleID AND att.RelatedRecordID = theRecordID;
			UPDATE `nts` SET nts._Deleted = 1 WHERE 
			nts.RelatedModuleID = theModuleID AND nts.RelatedRecordID = theRecordID;
			UPDATE `cos` SET cos._Deleted = 1 WHERE 
			cos.RelatedModuleID = theModuleID AND cos.RelatedRecordID = theRecordID;
			UPDATE `lnk` SET lnk._Deleted = 1 WHERE 
			lnk.RelatedModuleID = theModuleID AND lnk.RelatedRecordID = theRecordID;
			UPDATE `ntf` SET ntf._Deleted = 1 WHERE 
			ntf.RelatedModuleID = theModuleID AND ntf.RelatedRecordID = theRecordID;	
	END IF;
END;//
 
/* xes END */

/* xesr START */
DROP TRIGGER IF EXISTS xesr_afins //
CREATE TRIGGER xesr_afins AFTER INSERT ON `xesr` FOR EACH ROW
BEGIN
    
	CALL assign_register_handler( 
	 NEW._ExpenseID, 'xesr', 'ExpenseHandler' , NEW._ExpenseSubject, NEW._ModBy );
	
END;//
/* xesr END */
