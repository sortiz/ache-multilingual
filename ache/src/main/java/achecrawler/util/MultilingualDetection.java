package achecrawler.util;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.github.pemistahl.lingua.api.*;
import static com.github.pemistahl.lingua.api.Language.*;

import achecrawler.target.model.Page;

public class MultilingualDetection {
    
    private static final Logger logger = LoggerFactory.getLogger(MultilingualDetection.class);
    private static LanguageDetector detector;
    private static List<Language> languages;
    /**
     *  Loads language profiles from resources folder
     */
    static {
        
        languages = new ArrayList<>();
        languages.add(Language.ENGLISH);
        languages.add(Language.GERMAN);

        try {
            
            detector = LanguageDetectorBuilder.fromLanguages(Language.ENGLISH, Language.FRENCH, Language.GERMAN, Language.SPANISH).build();;
            
        } catch (Exception e) {
            throw new IllegalStateException("Could not load language profiles.");
        }
    }

    /**
     * Try to detect the language of the text in the String.
     * 
     * @param content
     * @return true if the String contains English language, false otherwise
     */
    public String isLanguage(String content) {
        try {

            if (content == null || content.isEmpty()) {
                return null;
            }
            
            Language detectedLanguage = detector.detectLanguageOf(content);
            return detectedLanguage.toString();

        } catch (Exception ex) {
            logger.warn("Problem while detecting language in text: " + content, ex);
            return null;
        }
    }

    /**
     * Try to detect the language of contents of the page.
     * 
     * @param page
     * @return true if the page is in a valid language, false otherwise
     */
    public Boolean isValidLanguage(Page page) {
        try {
            String langdetect = isLanguage(page.getParsedData().getCleanText());            
            return languages.contains(langdetect);
        } catch (Exception e) {
            System.out.println("Exception in detect_page");
            return false;
        }
    }

}
