package com.sist.web;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sist.manager.*;
import com.sist.service.*;
import com.sist.vo.*;
@RestController
public class CampRestController {
	@Autowired
	private CampService service;
	
}
